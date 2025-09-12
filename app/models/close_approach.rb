class CloseApproach < ApplicationRecord
  belongs_to :asteroid

  validates :close_approach_date, presence: true
end
