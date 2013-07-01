class UsersController < ApplicationController

  def index
  end

  def show
    @survey=Survey.find(params[:id])
    #current_user.survey_id=params[:id]
  end

end
