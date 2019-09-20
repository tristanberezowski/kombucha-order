require 'mailgun-ruby'

class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  after_create :email_receipt

  aasm :delivery_status, column: :delivery_status do
    state :undelivered, initial: true
    state :delivered

    event :deliver do
      transitions from: :undelivered, to: :delivered
    end
  end

  VALID_CITIES = [
    'Vancouver',
    'Langley',
    'Surrey',
    'Coquitlam',
    'Port Moody',
    'Maple Ridge',
  ]

  VALID_CITY_CLASSES = %w(
    Vancouver
    Langley
    Surrey
    Coquitlam
    PortMoody
    MapleRidge
  )

  def delivery_date
    make_delivery_date_next_possible(self.shipping_city)
  end

  def make_delivery_date_next_possible(city)
    formatted_city = city.gsub(/ /, '')
    if VALID_CITY_CLASSES.include? formatted_city
      constant = "Delivery::#{formatted_city}"
      city_class = constant.constantize
      return city_class.next_possible_delivery_date.noon
    else
      raise "Missing valid city: #{city} is invalid"
    end
  end

  def total
    total = 0
    order_products.each do |order_product|
      total += (order_product.quantity * order_product.product.price)
    end
    total += self.delivery_fee
    total += self.environmental_fee
    return total
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

  def delivery_fee
    user.delivery_fee
  end

  def environmental_fee
    total = 0
    order_products.each do |order_product|
      total += (order_product.quantity * order_product.product.environmental_fee)
    end
    return total
  end

  private

  def email_receipt
    # mail(to: "tristanberezowski@gmail.com", subject: "Welcome!").tap do |message|
    #   "Hope this works!"
    # end

    # mg_client = Mailgun::Client.new("f877bd7a-7e120914")

    # message_params =  {
    #                    from: 'tristan@mawji.vc',
    #                    to:   'tristanberezowski@gmail.com',
    #                    subject: 'The Ruby SDK is awesome!',
    #                    text:    'It is really easy to send a message!'
    #                   }
    
    # result = mg_client.send_message('example.com', message_params).to_h!
    
    # message_id = result['id']
    # message = result['message']

    # byebug

  end

  def product_prices
    products.map(&:price)
  end
end
