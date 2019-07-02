FactoryBot.define do
  factory :product do
    name { "PRODUCT-NAME" }
    rentable { [true, false].sample }
    purchasable { [true, false].sample }
    selectable factory: :liquid_selection
  end
end
