FactoryBot.define do
  factory :product_exemption do
    product factory: :product
    fee { Money.new(rand(500..1000)) }
  end
end
