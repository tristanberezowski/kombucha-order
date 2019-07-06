module Delivery
  class Surrey < City
    def self.next_possible_delivery_date
      delivery_fridays_only
    end
  end
end
