module Delivery
  class Vancouver < City
    def self.next_possible_delivery_date
      delivery_fridays_and_wednesdays
    end
  end
end
