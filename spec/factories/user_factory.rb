FactoryBot.define do
  factory :user do
    name { 'nome' }
    sequence(:iduff ) { |n| "iduff#{n}" }
    rating { 1 }
    password { 'password' }
  end
end
