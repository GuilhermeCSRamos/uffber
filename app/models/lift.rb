class Lift < ApplicationRecord
  has_many :lift_passenger#, class_name: 'LiftPassenger'
  accepts_nested_attributes_for :lift_passenger
  has_many :passenger, through: :lift_passenger#, class_name: 'Passenger'
  belongs_to :driver, optional: true

  scope :active, ->() { where(status: :active) }
  scope :ended, ->() { where(status: :ended) }
  scope :pending, ->() { where(status: :pending) }
  scope :cancelled, ->() { where(status: :cancelled) }

  enum status: {
    active: 0,
    ended: 1,
    pending: 2,
    cancelled: 3
  }
end
