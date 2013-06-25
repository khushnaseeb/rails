class Option < ActiveRecord::Base
  belongs_to :question
  attr_accessible :desc
  validate :desc, presence:true
end
