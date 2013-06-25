require 'spec_helper'

describe SurveysController do
  let(:survey){Survey.new(name:"pop",stype:"census")}

  describe "GET index" do
    it "check if @surveys" do
    #survey = Survey.create(name: "Survey1",stype: "general")
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
    it "should create a survey with valid parameters" do
      #survey = Survey.new(name: 'tree',stype: "census")
      post :create, {survey: {name: survey.name, stype: survey.stype}}
      expect(assigns(:survey).valid?).to eq(true)
      
    end


    it "should not create a survey with invalid parameters" do
      
      post :create , {survey: {}}
      expect(assigns(:survey).valid?).to  eq(false)
    end

    it "should not create survey if no of questions < 3" do
      post :create ,{survey:{name:"tree", stype:"census",questions_attributes:{ '1'=>{'desc'=>"wassup"},
                                                                                '2'=>{'desc'=>"hi!!"}}}}

      s=Survey.last
      p s
      expect(response).to render_template :new
    end
  


    it "should render new if survey has no questions" do
      #survey = Survey.new(name: 'tree',stype: 'general')
      post :create, {survey: {name: survey.name, stype:survey.stype}}

      expect(response).to render_template :new
    end

    it "should edit and update the survey" do
      #Survey.create(name:"pop", stype:"census")
      survey.save
      survey=Survey.first
      #p survey
      put :update, {id: survey.id,survey:{name:"john", stype: "general"}}
      p Survey.first
      expect(assigns(:survey)).to eq survey
      expect( response).to redirect_to surveys_path
      end

    it "should delete the specified survey" do
      #Survey.create(name:"pop", stype:"census")
      survey.save
      survey=Survey.first
      p survey
      #Survey.create(name:"rock", stype:"census")
      delete :destroy, {id: survey.id, survey:{name: "pop", stype: "census"}}
      p Survey.all
      expect(response).to redirect_to surveys_path
    end

  end
end
  


