FactoryBot.define do
  factory :order_product do
    order factory: :order
    product factory: :product
  end
end
