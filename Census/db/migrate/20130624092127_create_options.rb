class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :question
      t.string :desc

      t.timestamps
    end
    add_index :options, :question_id
  end
end
