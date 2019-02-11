class Generation < ApplicationRecord
    has_many :pokemon
    validates :generation, presence: true, uniqueness: true
end
