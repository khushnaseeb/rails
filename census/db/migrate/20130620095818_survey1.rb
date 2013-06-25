class Survey1 < ActiveRecord::Migration
  def change
  remove_column :surveys, :loacation, :string
  #add_column :location, :string
  end

  def down
  end
end
