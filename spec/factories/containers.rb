FactoryBot.define do
  factory :container do
    name { FFaker::Book.title }
    volume { rand(1...100000) }

    factory :keg do
      name { 'Keg' }
    end

    factory :growler do
      name { 'Growler' }
    end
  end
end
