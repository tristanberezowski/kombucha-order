FactoryBot.define do
  factory :product_container do
    product factory: :product
    container factory: :container
  end
end
