class Question < ActiveRecord::Base
  
  attr_accessible :desc, :options_attributes
  has_many :options, :dependent=> :destroy 
  belongs_to :survey
  has_one :answer, :dependent=>:destroy
  accepts_nested_attributes_for :options

  #validates_associated :options, :survey
  validates :desc,:presence=>true
  validates :options, :length=>{minimum:3, message:"must have 3 options"}
end
