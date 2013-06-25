class Question < ActiveRecord::Base
  
  attr_accessible :desc, :options_attributes
  has_many :options, :dependent=> :destroy 
  belongs_to :survey

  accepts_nested_attributes_for :options

  #validates_associated :options, :survey
  validate :desc,presence:true
end
