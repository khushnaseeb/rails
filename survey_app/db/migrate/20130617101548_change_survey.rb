class ChangeSurvey < ActiveRecord::Migration
  def change
    change_table :Surveys do |t|
    t.rename :stype, :s_type
  end
end


  def down
  end
end
