FactoryBot.define do
  factory :lift_passenger do
    pickup_location { 'pickup' }
    dropoff_location { 'dropoff' }

    lift
    passenger
  end
end
