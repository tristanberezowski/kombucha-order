FactoryBot.define do
  factory :container do
    name { FFaker::Book.title }
    volume { rand(1...100000) }
  end
end
