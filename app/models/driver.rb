class Driver < ApplicationRecord
  belongs_to :user

  validates :cnh, presence: true

  scope :with_lift, ->() { Lift.where(driver_id: id, status: :active) }
end
