class LiftPassenger < ApplicationRecord
  has_one :lift
  has_one :passenger

  validates :pickup_location, :dropoff_location, presence: true
end
