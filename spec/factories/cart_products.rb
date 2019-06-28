FactoryBot.define do
  factory :cart_product do
    cart factory: :cart
    product factory: :product
  end
end
