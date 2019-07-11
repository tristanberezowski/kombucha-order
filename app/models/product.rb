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

  def container
    self.selectable.container
  end

  private

  def valid_type?(type)
    VALID_TYPES.include?(type)
  end
end
