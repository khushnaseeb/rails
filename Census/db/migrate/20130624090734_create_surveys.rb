class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :stype
      t.string :location
      t.string :year
      t.string :result
      t.timestamps
    end
  end
end
