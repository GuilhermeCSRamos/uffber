FactoryBot.define do
  factory :lift do
    status { 1 }
    start_location { "teste start" }
    end_location { "teste end" }

    # association :driver
    # association :passenger
  end

  trait :with_driver do
    status { 0 }
  end

  trait :without_driver do
    status { 2 }
  end
end
