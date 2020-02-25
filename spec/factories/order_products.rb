FactoryBot.define do
  factory :order_product do
    order factory: :order
    product factory: :product
    quantity { rand(1..10) }
    price { Money.new(5) }
  end
end
