FactoryBot.define do
  factory :flavour do
    liquid factory: :liquid
    name { FFaker::Food.fruit }
    description { FFaker::Lorem.paragraph }
    price { Money.new(rand(10..200)) }
  end
end
