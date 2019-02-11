class Pokemon < ApplicationRecord
  belongs_to :generation
  belongs_to :element_type
  has_many :team_members
  validates :name, :pokedexID, presence: true
  validates :pokedexID, numericality: { only_integer: true }
end
