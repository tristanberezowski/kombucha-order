FactoryBot.define do
  factory :liquid_price do
    price { Money.new(20) }
    liquid factory: :liquid
    container factory: :container
  end
end
