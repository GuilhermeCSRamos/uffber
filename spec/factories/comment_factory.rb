FactoryBot.define do
  factory :comment do
    body { 'corpo do comentário' }

    association :lift
    association :user
  end
end
