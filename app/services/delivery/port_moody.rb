module Delivery
  class PortMoody < City
    def self.next_possible_delivery_date
      delivery_thursdays_only
    end
  end
end
