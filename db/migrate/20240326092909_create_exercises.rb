class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.references :block, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
