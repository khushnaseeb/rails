class Question < ActiveRecord::Migration
  def change
    create_table :Questions do |t|
      t.string :desc
      t.references :Surveys
  end
  end

  def down
  end
end
