require 'spec_helper'

describe Survey do

  let(:survey) {Survey.new(name: "Tree Census",stype:"general",year:'2011',location:"pune",audience:"corporate")}
    #factory_girl or fixtures #for after or any desired place ,fixtures:kind of fixed objects

  it "must have a name" do
    survey.save
    survey.should be_valid
  end

 it "must have a year" do
   survey.save
   survey.should be_valid
 end

  it "should not be valid without a name" do
    survey.name=nil
    survey.should_not be_valid
    survey.should have(1).errors_on(:name)
  end

  it "must have an intended audience" do
    survey.audience=nil
    survey.save
    survey.should_not  be_valid
  end

 
 it "must have a type" do
   survey.stype=nil
   survey.save
   survey.should_not  be_valid
 end


  it "must have a location" do
    survey.location=nil
    survey.save
    survey.should_not be_valid
  end

end

=begin
  it "must have at least 3 questions"
  it "response must be recorded"
end
describe Question do
 
  it "questions should be unique in a survey"
  it "must have a description"
  it "options should have atleast 3 options"
 
end

describe Option
it "should not be blank"
it "should be unique"

end
=end
