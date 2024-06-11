class User < ApplicationRecord
  has_one :passenger

  validates :iduff, presence: true
  validates :name, presence: true
  validates :rating, presence: true
end
