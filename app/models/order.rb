class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  aasm column: :delivery_status do
    state :undelivered, initial: true
    state :delivered

    event :deliver do
      transitions from: :undelivered, to: :delivered
    end
  end

  aasm column: :payment_status do
    state :unpaid, initial: true
    state :paid

    event :pay do
      transitions from: :unpaid, to: :paid
    end
  end

  def make_delivery_date_next_possible(city) #TODO Add time parameter
    case city
    when 'Vancouver'
      return delivery_fridays_and_wednesdays.noon
    when 'Langley'
      return delivery_fridays_only.noon
    when 'Surrey'
      return delivery_fridays_only.noon
    when 'Coquitlam'
      return delivery_thursdays_only.noon
    when 'Port Moody'
      return delivery_thursdays_only.noon
    when 'Maple Ridge'
      return delivery_thursdays_only.noon
    else
      return nil
    end

  end

  def total
    product_prices.inject(Money.new(0), &:+)
  end

  def email
    user.email
  end

  def add_products(cart_products)
    cart_products.each do |cart_product|
      self.order_products << OrderProduct.new(
        order: self,
        product: cart_product.product,
        quantity: cart_product.quantity,
        price: cart_product.product.price,
      )
    end
  end

  private

  def delivery_thursdays_only
    if Time.current.tuesday? && Time.current <= Time.current.noon
      # it is tuesday and before noon
      return next_wday(4) # Delivery is this thursday
    elsif Time.current.tuesday? == 0 && Time.current > Time.current.noon
      # it is tuesday past noon
      return next_wday(4) + 1.week # Delivery is next thursday
    elsif Time.current.wednesday? || Time.current.thursday?
      # it is wednesday or thursday
      return next_wday(4) + 1.week # Delivery is next thursday
    else
      return next_wday(4) # Delivery is this thursday
    end
  end

  def delivery_fridays_and_wednesdays
    if Time.current.wednesday? && Time.current <= Time.current.noon
      # it is wednesday and before noon
      return next_wday(5) #Delivery will be this friday
    elsif( ( Time.current.tuesday? ) || ( Time.current.monday? && Time.current > Time.current.noon) )
      # it is Tuesday or Monday after noon
      return next_wday(5) #Delivery will be this friday
    elsif Time.current.wednesday? && Time.current.hour >= 12
      # it is wednesday but past noon
      return next_wday(3) + 1.week #Delivery will be next Wednesday
    else
      # it is between Wed 12pm and Monday 11:59am
      return next_wday(3) # Delivery will be this Wednesday
    end
  end

  def delivery_fridays_only
    if Time.current.wednesday? && Time.current <= Time.current.noon
      # it is wednesday and before noon
      return next_wday(5) # Delivery is this friday
    elsif Time.current.wednesday? == 0 && Time.current > Time.current.noon
      # it is wednesday past noon
      return next_wday(5) + 1.week # Delivery is next friday
    elsif Time.current.thursday? || Time.current.friday?
      # it is thursday or friday
      return next_wday(5) + 1.week # Delivery is next friday
    else
      return next_wday(5) # Delivery is this friday
    end
  end

  def next_wday (weekday) #0 is sunday, 1 is monday... 6 is saturday
    #Takes in weekday number requested, returns how many days from now it is
    (0..6).each do |days_from_now|
      if days_from_now.day.from_now.wday == weekday
        return days_from_now.day.from_now
      end
    end
    raise
  end

  def product_prices
    products.map(&:price)
  end
end
