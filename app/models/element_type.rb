class ElementType < ApplicationRecord
    has_many :pokemons
    validates :typeName, presence: true, uniqueness: true
end
