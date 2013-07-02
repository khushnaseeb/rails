class UsersController < ApplicationController

  def index
    if current_user.answers.all.size==0
      @message="you have not given any surveys!!"
      redirect_to surveys_path(@message)
    end
  end

  def show
    if current_user.answers.where(:survey_id=>params[:id]).empty?
      p Answer.where(params[:id])
      @survey=Survey.find(params[:id])
       #current_user.survey_id=params[:id]
    else
      redirect_to surveys_path
    end
  end

end
