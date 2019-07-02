FactoryBot.define do
  factory :liquid_selection do
    flavour factory: :flavour
    container factory: :container
  end
end
