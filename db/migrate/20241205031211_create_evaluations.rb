class CreateEvaluations < ActiveRecord::Migration[7.2]
  def change
    create_table :evaluations do |t|
      t.integer :rating
      t.string :game_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
