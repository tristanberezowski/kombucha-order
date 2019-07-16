FactoryBot.define do
  factory :delivery_exemption do
    fee { Money.new(rand(100..500)) }
  end
end
