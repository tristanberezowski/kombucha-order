class Product < ApplicationRecord
  belongs_to :selectable, polymorphic: true

  VALID_TYPES = %w(
    LiquidSelection
  )

  validates_presence_of :name
  validates :selectable_type, inclusion: { in: VALID_TYPES }, presence: true

  accepts_nested_attributes_for :selectable

  def build_selectable(type, attributes={})
    if valid_type?(type)
      self.selectable = type.constantize.new(attributes)
    end
  end

  def price_for user
    #if user has a liquid price, use that. Otherwise default price
    if user == nil
      return LiquidPrice.find_by(user: nil, container: self.container, liquid: self.liquid).price 
    end
    user_price = LiquidPrice.find_by(user: user, container: self.container, liquid: self.liquid)
    if user_price == nil
      return LiquidPrice.find_by(user: nil, container: self.container, liquid: self.liquid).price
    end
    return user_price.price
  end

  def container
    self.selectable.container
  end

  def environmental_fee
    self.container.environmental_fee
  end

  def flavour
    self.selectable.flavour
  end

  def liquid
    self.selectable.flavour.liquid
  end  

  private

  def valid_type?(type)
    VALID_TYPES.include?(type)
  end
end
