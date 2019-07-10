class Payment < ApplicationRecord
  belongs_to :order
  validates_presence_of :payment_date, :payee, :payment_method
end
