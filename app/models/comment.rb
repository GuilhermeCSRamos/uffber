class Comment < ApplicationRecord
  belongs_to :lift
  belongs_to :user

  validates :body, presence: true

  scope :by_lift, ->(lift_id) { where(lift_id: lift_id) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
