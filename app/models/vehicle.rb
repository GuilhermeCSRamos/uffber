class Vehicle < ApplicationRecord
  belongs_to :driver

  # validates

  enum type: {
    motorcycle: 0,
    car: 1,
    van: 2
  }
end
