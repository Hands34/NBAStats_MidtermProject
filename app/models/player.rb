class Player < ApplicationRecord
  belongs_to :college
  belongs_to :team

  validates :full_name, :games_played, :minutes, :points, :rebounds,
            :assists, :steals, :blocks, :turnovers, presence: true
end
