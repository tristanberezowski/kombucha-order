FactoryBot.define do
  factory :product do
    name { FFaker::Book.name }
    rentable { [true, false].sample }
    purchasable { [true, false].sample }
    selectable factory: :liquid_selection
  end
end
