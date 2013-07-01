class Answer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :survey
      t.references  :question
      t.references  :option
      t.references  :user
    end
  end

  def down
  end
end
