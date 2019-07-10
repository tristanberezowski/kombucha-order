FactoryBot.define do
  factory :payment do
    order { create(:order) }
    payee { FFaker::Name.name }
    contact_information { FFaker::Internet.email }
    payment_method { ["Credit Card", "Cheque", "Etransfer"].sample }
    payment_date { Date.current - rand(1..100).days }
  end
end
