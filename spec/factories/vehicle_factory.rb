FactoryBot.define do
  factory :vehicle do
    model { 'uno' }
    color { 'vermelho' }
    license_plate { 'oiu123u1' }
    capacity { 4 }
    type { 1 }

    association :driver
  end
end
