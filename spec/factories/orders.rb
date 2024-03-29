FactoryBot.define do
  factory :order do
    user factory: :user
    billing_name { FFaker::Name.name }
    billing_address { FFaker::Address.street_address }
    billing_city { FFaker::Address.city }
    billing_province { FFaker::AddressUS.state }
    billing_postal { FFaker::AddressUS.zip_code }
    billing_country { FFaker::Address.country }
    shipping_name { FFaker::Name.name }
    shipping_address { FFaker::Address.street_address }
    shipping_city { Order::VALID_CITIES.sample }
    shipping_province { FFaker::AddressUS.state }
    shipping_postal { FFaker::AddressUS.zip_code }
    shipping_country { FFaker::Address.country }
    note { FFaker::Lorem.paragraph }
        
    factory :delivered_order do
      after(:create) do |order|
            order.deliver!
      end
    end
  end
end
