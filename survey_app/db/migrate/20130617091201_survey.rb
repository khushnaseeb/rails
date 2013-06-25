class Survey < ActiveRecord::Migration
  def change
   create_table :Surveys do |t|
      t.string :name
      t.string :stype
 
      t.timestamps
      end
  end

  def down
  end
end
