class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey=Survey.new
    3.times do
      question=@survey.questions.build
      4.times {  question.options.build}
    end
  end

  def create
    @survey=Survey.new(params[:survey])
    if @survey.questions.length > 2  
      if @survey.save!
      redirect_to surveys_path
      else
      render :action=> 'new'
      end
    else
      render :action=> 'new'
    end
  end


  def edit
    p params
    @survey=Survey.find(params[:id])
    p @survey
  end

  def update
    @survey=Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to surveys_path
    else
      render :action=>'edit'
    end
  end

  def destroy
    Survey.find(params[:id]).destroy
    redirect_to surveys_path
  end

end
