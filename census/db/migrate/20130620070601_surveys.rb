class Surveys < ActiveRecord::Migration
  def change
    add_column :surveys, :year, :string
  end

  def down
  end
end
