FactoryBot.define do
  factory :user_exemption do
    user factory: :user
    exemptable factory: :delivery_exemption
  end
end
