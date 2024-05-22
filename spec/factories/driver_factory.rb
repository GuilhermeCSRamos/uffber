FactoryBot.define do
  factory :driver do
    cnh { 'cnh do motorista' }

    association :user
  end
end
