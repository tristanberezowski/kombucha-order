class LiquidSelection < ApplicationRecord
  belongs_to :flavour
  belongs_to :container
  has_one :liquid, through: :flavour

  def price
    container.price + total_flavour_price
  end

  def to_partial
    'selectables/liquid_selection/form'
  end

  private

  def total_flavour_price
    flavour.price * container.volume
  end
end
