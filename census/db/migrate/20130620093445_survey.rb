class Survey < ActiveRecord::Migration
  def change
  add_column :surveys, :loacation,  :string 
  add_column :surveys, :audience, :string 

  end

  def down
  end
end
