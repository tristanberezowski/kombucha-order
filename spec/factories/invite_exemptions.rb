FactoryBot.define do
  factory :invite_exemption do
    invite factory: :invite
    exemptable factory: :delivery_exemption
  end
end
