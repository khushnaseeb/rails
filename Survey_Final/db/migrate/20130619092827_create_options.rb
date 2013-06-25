class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :desc
      t.references :question

      t.timestamps
    end
    add_index :options, :question_id
  end
end
