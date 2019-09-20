FactoryBot.define do
  factory :container do
    name { FFaker::Vehicle.make }
    volume { rand(1...100000) }
    environmental_fee { Money.new(0.15) }

    factory :keg do
      name { 'Keg' }
    end

    factory :growler do
      name { 'Growler' }
    end
  end
end
