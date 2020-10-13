class Player < ApplicationRecord
  belongs_to :college
  belongs_to :team

  validates :name, presence: true
end
