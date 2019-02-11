class Team < ApplicationRecord
  belongs_to :trainer
  has_many :team_members
  validates :teamName, presence: true, length: {minimum:3, maximum:20}
end
