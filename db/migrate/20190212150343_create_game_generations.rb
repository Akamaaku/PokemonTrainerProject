class CreateGameGenerations < ActiveRecord::Migration[5.2]
  def change
    create_table :game_generations do |t|
      t.references :game, foreign_key: true
      t.references :generation, foreign_key: true

      t.timestamps
    end
  end
end
