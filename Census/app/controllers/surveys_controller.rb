class SurveysController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @surveys = Survey.all
  end

  def new
    if current_user.name!="admin"
      redirect_to surveys_path
    end
    @survey=Survey.new
    3.times do
      question=@survey.questions.build
      4.times {  question.options.build}
    end
  end
     
 def create
   if current_user.name!="admin"
     redirect_to surveys_path
   end
   @survey=Survey.new(params[:survey])
   #if @survey.questions.length > 2 
    # flag=true
   #@survey.questions.each { |q| flag=false  if q.options.length <2}
   if @survey.save #and flag
     redirect_to surveys_path
   else
     render :action=> 'new'
   end
    #else
     # render :action=> 'new'
    #end
 end


  def edit
    if current_user.name!="admin"
      redirect_to surveys_path
    end
    p params
    @survey=Survey.find(params[:id])
    p @survey
  end

  def update
    if current_user.name!="admin"
      redirect_to surveys_path
    end
    @survey=Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to surveys_path
    else
      render :action=>'edit'
    end
  end

  def destroy
    if current_user.name!="admin"
      redirect_to surveys_path
    end
    Survey.destroy(params[:id])
    redirect_to surveys_path
  end

  def show
    @survey=Survey.find(params[:id])
    #p @survey
    render 'action'=> 'take_survey'
  end
end




