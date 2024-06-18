FactoryBot.define do
  factory :vehicle do
    model { 'uno' }
    color { 'vermelho' }
    license_plate { 'oiu123u1' }
    capacity { 4 }
    kind { 1 }

    association :driver
  end
end
