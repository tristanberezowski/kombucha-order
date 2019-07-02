class LiquidSelection < ApplicationRecord
  belongs_to :flavour
  belongs_to :container
  has_one :liquid, through: :flavour
  has_one :product, as: :selectable

  def price
    product.try(:price) || container.price + total_flavour_price
  end

  def to_partial
    'selectables/liquid_selection/form'
  end

  def name
    "#{container.name} of #{flavour.name}"
  end

  private

  def total_flavour_price
    flavour.price * container.volume
  end

end
