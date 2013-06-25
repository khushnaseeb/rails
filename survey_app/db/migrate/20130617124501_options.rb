class Options < ActiveRecord::Migration
  def change
  create_table :options do |t|
    t.string :desc
    t.references :Question
    end
  end

  def down
  end
end
