class Option < ActiveRecord::Migration
  def change
    add_column :options, :references, :Question  
    add_column :options, :desc, :string
  end

  def down
  end
end
