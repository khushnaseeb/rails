class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :desc
      t.references :User
      t.references :Question
      t.references :Option

      t.timestamps
    end
    add_index :answers, :User_id
    add_index :answers, :Question_id
    add_index :answers, :Option_id
  
  end
end
