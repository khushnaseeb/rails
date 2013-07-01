class Survey < ActiveRecord::Base
  attr_accessible :name, :stype,:location,:result,:year,:questions_attributes
  has_many :questions, :dependent=>:destroy
  has_many :options, through: :questions
  has_many :users
  has_many :answers, through: :users
  accepts_nested_attributes_for :questions, :allow_destroy=>true

  #has_and_belongs_to_many :users
  has_many :users

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :stype, presence: true
  validates :questions, length:{minimum:3, message:"must have at least 3 questions"}#validates :question_attributes, presence: true

end
