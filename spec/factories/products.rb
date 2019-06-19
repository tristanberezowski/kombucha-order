FactoryBot.define do
  factory :product do
    name { FFaker::Book.name }
    price { '5.00' }
    rentable { [true, false].sample }
    purchasable { [true, false].sample }
  end
end
