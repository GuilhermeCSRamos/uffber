class Driver < ApplicationRecord
  belongs_to :user
  has_many :lifts

  validates :cnh, presence: true

  scope :with_lifts, -> { joins(:lifts).where(lifts: { status: 'active' }).distinct }

  def active_lifts
    lifts.active
  end
end
