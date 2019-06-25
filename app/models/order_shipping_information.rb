class OrderShippingInformation < ApplicationRecord
    belongs_to :order
    validates_presence_of :order

end
