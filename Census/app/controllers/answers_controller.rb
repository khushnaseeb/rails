class AnswersController < ApplicationController
  def index

  end


  def show

  end

  def create
   p = params[:option_selected]
    if p!=nil 
      params[:option_selected].each_pair {|key, value| @answer=Answer.create(user_id:current_user.id,option_id:value,question_id:key,survey_id:Question.find(key).survey_id)}    
      
      redirect_to users_path
    else
      render  "users/show"
    end
  end

end
