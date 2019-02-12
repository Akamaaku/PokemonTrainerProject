class Game < ApplicationRecord
    has_many :generations, through: :games_generations
    validates :title, :dateCreated, presence: true
    validates :title, uniqueness: true
end
