class Mascot < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
end
