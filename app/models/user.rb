class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_exemptions
  has_many :product_exemptions,
    through: :user_exemptions,
    source: :exemptable,
    source_type: 'ProductExemption'
  has_many :delivery_exemptions,
    through: :user_exemptions,
    source: :exemptable,
    source_type: 'DeliveryExemption'
  has_one :cart
  has_many :cart_products, through: :cart

  def cart
    Cart.find_or_create_by!(user: self)
  end

  DEFAULT_DELIVERY_FEE = Money.new(700)

  def delivery_fee
    self.delivery_exemption ? self.delivery_exemption.fee : DEFAULT_DELIVERY_FEE
  end

  def delivery_exemption
    delivery_exemptions.first
  end

  def exemptions
    user_exemptions
  end
end
