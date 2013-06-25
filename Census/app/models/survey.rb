class Survey < ActiveRecord::Base
  attr_accessible :name, :stype,:location,:result,:year,:questions_attributes
  has_many :questions, :dependent=>:destroy
  accepts_nested_attributes_for :questions, :allow_destroy=> :true



  validates :name, presence: true
  validates :name, uniqueness: true
  validates :stype, presence: true
  #validates :question_attributes, presence: true

end
