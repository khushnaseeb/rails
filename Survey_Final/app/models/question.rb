class Question < ActiveRecord::Base
  has_many :options
  belongs_to :survey
  attr_accessible :desc
end
