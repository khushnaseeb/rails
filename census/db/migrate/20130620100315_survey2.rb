class Survey2 < ActiveRecord::Migration
  def change
    add_column :surveys, :location, :string
  end

  def down
  end
end
