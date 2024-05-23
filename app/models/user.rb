class User < ApplicationRecord
  validates :iduff, presence: true
  validates :name, presence: true
  validates :rating, presence: true

end
