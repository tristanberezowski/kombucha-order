FactoryBot.define do
  factory :order_selection do
    order factory: :order
    selectable factory: :liquid_selection
  end
end
