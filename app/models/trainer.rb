class Trainer < ApplicationRecord
    has_one :team
    validates :name, :trainerType, presence:true
    validates :name, length: {minimum: 2, maximum: 20}
end
