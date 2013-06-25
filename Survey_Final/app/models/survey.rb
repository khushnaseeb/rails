class Survey < ActiveRecord::Base
 has_many :questions
 attr_accessible :name, :stype
end
