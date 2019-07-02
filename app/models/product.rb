class Product < ApplicationRecord
  belongs_to :selectable, polymorphic: true

  has_many :product_containers
  has_many :available_containers,
    through: :product_containers,
    class_name: 'Container',
    source: :container

  VALID_TYPES = %w(
    LiquidSelection
  )

  validates_presence_of :name
  validates :selectable_type, inclusion: { in: VALID_TYPES }, presence: true

  accepts_nested_attributes_for :selectable

  def price
    selectable.price
  end

  def build_selectable(type, attributes={})
    if valid_type?(type)
      self.selectable = type.constantize.new(attributes)
    end
  end

  private

  def valid_type?(type)
    VALID_TYPES.include?(type)
  end
end
