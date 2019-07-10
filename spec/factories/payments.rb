FactoryBot.define do
  factory :payment do
    order { nil }
    payee { "MyString" }
    contact_information { "MyString" }
    payment_method { "MyString" }
    payment_date { "2019-07-09" }
  end
end
