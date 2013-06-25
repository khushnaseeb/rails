class Answers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :desc
      t.references :Question
      t.references :Options
      t.references :Users
      t.timestamps
    end
  end

  def down
  end
end
