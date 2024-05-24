class Passenger < ApplicationRecord
  has_many :lift_passenger#, class_name: 'LiftPassenger'
  has_many :lift, through: :lift_passenger#, class_name: 'Lift'
  belongs_to :user

  scope :with_lifts, -> { joins(:lift).where(lifts: { status: 'active' }).distinct }
end
