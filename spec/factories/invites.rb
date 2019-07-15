FactoryBot.define do
  factory :invite do
    email { FFaker::Internet.email }
    admin factory: :admin
  end
end
