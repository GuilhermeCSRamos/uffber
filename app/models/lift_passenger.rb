class LiftPassenger < ApplicationRecord
  belongs_to :lift
  belongs_to :passenger
  self.table_name = "lifts_passengers"

  validates :pickup_location, :dropoff_location, presence: true
end
