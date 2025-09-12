class Asteroid < ApplicationRecord
  has_many :close_approaches, dependent: :destroy

  validates :nasa_jpl_id, presence: true, uniqueness: true
  validates :name, presence: true
end
