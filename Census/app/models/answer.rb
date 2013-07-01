class Answer < ActiveRecord::Base
  attr_accessible :option_id, :question_id, :user_id, :survey_id
  belongs_to :user
  belongs_to :question
  belongs_to :survey
  #belongs_to :option
end
