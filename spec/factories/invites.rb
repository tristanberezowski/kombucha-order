FactoryBot.define do
  factory :invite do
    email { FFaker::Internet.email }
    admin factory: :admin
    factory :delivered_invite do
      after :create do |invite|
        invite.deliver!
      end
    end
  end
end
