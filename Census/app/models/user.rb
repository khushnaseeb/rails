class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_and_belongs_to_many :surveys
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,:email, :password, :password_confirmation, :remember_me
  attr_accessible :survey_id
  has_many :answers,:dependent=>:destroy
  belongs_to  :survey
  validates_presence_of :name, :email
  validates :name, :format=> { :with => /\A[a-zA-Z]+\z/},:length =>{:minimum =>4}
  
  validates_uniqueness_of :name,:email, :case_sensitive => false
end
