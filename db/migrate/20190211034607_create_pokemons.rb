class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :pokedexID
      t.string :name
      t.string :pokedexDescription
      t.string :evolveTo
      t.string :evolveFrom
      t.string :secondaryType
      t.string :imageURL
      t.references :generation, foreign_key: true
      t.references :element_type, foreign_key: true

      t.timestamps
    end
  end
end
