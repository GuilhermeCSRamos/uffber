class User < ApplicationRecord
  has_one :passenger
  has_one :driver

  validates :iduff, presence: true
  validates :name, presence: true
  validates :rating, presence: true
end
