class Pokemon < ApplicationRecord
  belongs_to :generation
  belongs_to :element_type
  validates :name, :pokedexID, presence: true
  validates :pokedexID, numericality: { only_integer: true }
end
