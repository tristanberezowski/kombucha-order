FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'password' }
    name { FFaker::Name.name }
    company_name { FFaker::Company.name }
    shipping_address { FFaker::AddressCA.street_address }
    shipping_city { FFaker::AddressCA.city }
    shipping_postal { FFaker::AddressCA.postal_code }
    shipping_province { FFaker::AddressCA.province }
  end
end
