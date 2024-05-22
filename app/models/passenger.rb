class Passenger < ApplicationRecord
  belongs_to :user

  scope :with_lift, ->() { Lift.where(passenger_id: id, status: :active) }
end
