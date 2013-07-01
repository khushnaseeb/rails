require 'spec_helper'

describe SurveysController do
  let(:survey){Survey.new(name:"pop",stype:"census",questions_attributes:{
    
               '1'=>{'desc'=>"wassup",options_attributes:{'1'=>{desc:"option1"},'2'=>{desc:"option2"},'3'=>{desc:"option3"}}},
               '2'=>{'desc'=>"hi!!",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"},'3'=>{desc:"option3"}}},
               '3'=>{'desc'=>"question3",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"},'3'=>{desc:"option3"}}}
       
             })}

  describe "GET index" do
  
    it "check if @surveys" do
    survey.save
    get :index
    expect(assigns(:surveys).count).to eq(1)
    expect(assigns(:surveys)).to eq([survey])
    expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

  end


  describe "GET new" do
    it "should assign empty survey object[@survey]" do
      get :new

      expect(assigns(:survey).new_record?).to eq(true)
      expect(response).to render_template :new
      expect(response.status).to eq(200)
    end
  end

  describe "Post #create" do
    it "should not create a survey with valid parameters" do
      post :create, {survey: {name: survey.name, stype: survey.stype,questions_attributes:{
        
                '1'=>{'desc'=>"wassup",options_attributes:{'1'=>{desc:"option1"},'2'=>{desc:"option2"}}},
                '2'=>{'desc'=>"hi!!",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"}}},
                '3'=>{'desc'=>"question3",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"}}}
      
       }}}
      expect(assigns(:survey).valid?).to eq(false)
  end

=begin
    it "should not create a survey with invalid parameters" do
      
      post :create , {survey: {}}
      expect(assigns(:survey).valid?).to  eq(false)
    end
=end

    it "should not create survey if no. of questions<3 and options<3"  do
      post :create ,{survey:{name:"tree", stype:"census",questions_attributes:{ 
        
        '1'=>{'desc'=>"wassup",options_attributes:{'1'=>{desc:"option1"},'2'=>{desc:"option2"}}},
        '2'=>{'desc'=>"hi!!",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"}}},
        '3'=>{'desc'=>"question3",options_attributes:{'1'=>{desc:"opt1"},'2'=>{desc:"opt2"}}}
      
      }}}

      #s=Survey.last
      #p s.questions

      #s.questions.each do |q|
       # p q.options
      #end
      expect(response).to render_template :new
    end
  


    it "should render new if survey has no questions" do
      post :create, {survey: {name: survey.name, stype:survey.stype}}
      expect(response).to render_template :new
    end

    it "should edit and update the survey" do
      survey.save
      survey=Survey.first
      #p survey
      put :update,{id: survey.id, survey: {name:"john",stype:"general"}}
       

      #print Survey.first
      print Survey.first.name
      expect(assigns(:survey)).to eq survey
      expect( response).to redirect_to surveys_path
      end

    it "should delete the specified survey" do
      survey.save
      survey=Survey.first
      #p survey
      delete :destroy, id: survey.id #, survey:{name: "pop", stype: "census"}}
      p Survey.all
      expect(response).to redirect_to surveys_path
    end


  end
end
  

