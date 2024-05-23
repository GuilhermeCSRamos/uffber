class Lift < ApplicationRecord
  belongs_to :driver, optional: true
  has_many :passenger, optional: true

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
