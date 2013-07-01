class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  attr_accessible :desc
  #has_one :answer
  validates :desc, presence:true
end
