class OrderSelection < ApplicationRecord
  belongs_to :order
  belongs_to :selectable, polymorphic: true

  delegate :price, to: :selectable

  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }

  def name
    "#{quantity}x #{selectable.name}"
  end
end
