class Team < ApplicationRecord
  has_many :players
  has_one :mascot
  validates :name, presence: true, uniqueness: true

  def self.ordered_by_players
    self.select("teams.*")
        .select("COUNT(teams.id) as player_count")
        .left_joins(:players)
        .group("teams.id")
        .order("player_count DESC")
  end
end
