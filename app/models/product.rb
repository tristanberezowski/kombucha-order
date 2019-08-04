class Product < ApplicationRecord
  belongs_to :selectable, polymorphic: true

  VALID_TYPES = %w(
    LiquidSelection
  )

  validates_presence_of :name
  validates :selectable_type, inclusion: { in: VALID_TYPES }, presence: true

  accepts_nested_attributes_for :selectable

  monetize :price_cents

  def build_selectable(type, attributes={})
    if valid_type?(type)
      self.selectable = type.constantize.new(attributes)
    end
  end

  def price_for user
    #if it has a product exemption for current user, show that price
    if user == nil
      return self.price
    end
    product_exemption = user.product_exemptions.where(product: self).first
    product_exemption ? product_exemption.fee : self.price
  end

  def container
    self.selectable.container
  end

  private

  def valid_type?(type)
    VALID_TYPES.include?(type)
  end
end
