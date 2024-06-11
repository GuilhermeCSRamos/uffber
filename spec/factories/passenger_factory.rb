FactoryBot.define do
  factory :passenger do
    association :user
    # association :lift
  end
end
