class LiftPassenger < ApplicationRecord
  belongs_to :lift
  belongs_to :passenger

  validates :pickup_location, :dropoff_location, presence: true
end
