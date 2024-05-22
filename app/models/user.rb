class User < ApplicationRecord
  validates :iduff, presence: true
  validates :name, presencece:true

  scope :with_lift, ->() { Lift.where(user_id: id, status: :active) }
end
