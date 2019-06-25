class Order < ApplicationRecord
    belongs_to :user
    has_one :order_billing_information
    has_one :order_shipping_information
    accepts_nested_attributes_for :order_billing_information
    accepts_nested_attributes_for :order_shipping_information
end
