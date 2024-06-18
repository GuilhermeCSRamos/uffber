class Vehicle < ApplicationRecord
  belongs_to :driver

  validates :driver_id, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :license_plate, presence: true
  validates :capacity, presence: true
  validates :kind, presence: true

  enum kind: {
    motorcycle: 0,
    car: 1,
    van: 2
  }
end
