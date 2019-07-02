FactoryBot.define do
  factory :cart_product do
    cart factory: :cart
    product factory: :product
    quantity { rand(1..10) }
  end
end
