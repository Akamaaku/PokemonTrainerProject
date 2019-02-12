class Generation < ApplicationRecord
    has_many :pokemons
    has_many :games, through: :games_generations
    validates :generation, presence: true, uniqueness: true
end
