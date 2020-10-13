class Team < ApplicationRecord
  has_many :players
  has_one :mascot
  validates :name, presence: true, uniqueness: true
end
