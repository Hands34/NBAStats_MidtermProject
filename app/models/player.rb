class Player < ApplicationRecord
  belongs_to :college
  belongs_to :team
  has_many :positions

  validates :full_name, :games_played, :minutes, :points, :rebounds,
            :assists, :steals, :blocks, :turnovers, presence: true

  validates :points, :rebounds, :assists, :steals, :blocks, :turnovers, numericality: { only_integer: true }
end
