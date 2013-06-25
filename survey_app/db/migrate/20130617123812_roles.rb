class Roles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name  
  end
end
  def down
  end
end
