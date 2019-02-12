class CreateJoinTableGameGeneration < ActiveRecord::Migration[5.2]
  def change
    create_join_table :games, :generations do |t|
      # t.index [:game_id, :generation_id]
      # t.index [:generation_id, :game_id]
    end
  end
end
