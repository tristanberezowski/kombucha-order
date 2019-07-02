FactoryBot.define do
  factory :flavour do
    liquid factory: :liquid
    name { FFaker::Job.title }
    description { FFaker::Lorem.paragraph }
  end
end
