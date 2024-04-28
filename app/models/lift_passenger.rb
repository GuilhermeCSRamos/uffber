class LiftPassenger < ApplicationRecord
  belongs_to :lift
  belongs_to :passenger
end
