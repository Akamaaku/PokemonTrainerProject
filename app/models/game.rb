class Game < ApplicationRecord
    validates :title, :dateCreated, presence:true
    validates :title, uniqueness: true
end
