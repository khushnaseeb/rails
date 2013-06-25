class Survey < ActiveRecord::Base
  attr_accessible :name, :stype, :year,:location, :audience

 validates :year , :presence=> true
 validates :name , :presence=> true
 validates :location, :presence=>true
 validates :audience, :presence=>true
 validates :stype, :presence=>true, 
end
