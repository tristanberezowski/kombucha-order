module Delivery
  class City
    class << self

      private

      def delivery_thursdays_only
        if tuesday_after_noon? || wednesday_or_thursday?
          return next_weekday("thursday") + 1.week # Delivery is next thursday
        else
          return next_weekday("thursday") # Delivery is this thursday
        end
      end

      def delivery_fridays_and_wednesdays
        if wednesday_before_noon? || tuesday_or_monday_after_noon?
          return next_weekday("friday") #Delivery will be this friday
        elsif wednesday_after_noon? 
          return next_weekday("wednesday") + 1.week #Delivery will be next Wednesday
        else
          # it is between Wed 12pm and Monday 11:"friday"9am
          return next_weekday("wednesday") # Delivery will be this Wednesday
        end
      end

      def delivery_fridays_only
        if wednesday_after_noon? || thursday_or_friday?
          return next_weekday("friday") + 1.week # Delivery is next friday
        else
          return next_weekday("friday") # Delivery is this friday
        end
      end

      def next_weekday(weekday)
        if weekday.capitalize == current_weekday
          return today
        else
          return (today + 1.week).beginning_of_week(weekday.to_sym)
        end
      end

      def current_weekday
        today.strftime('%A')
      end

      def tuesday_after_noon?
        time.tuesday? == 0 && after_noon?
      end

      def wednesday_or_thursday?
        time.wednesday? || time.thursday?
      end

      def wednesday_before_noon?
        time.wednesday? && before_noon?
      end

      def tuesday_or_monday_after_noon?
        time.tuesday? || monday_after_noon?
      end

      def monday_after_noon?
        time.monday? && after_noon?
      end

      def wednesday_after_noon?
        time.wednesday? && after_noon?
      end

      def wednesday_before_noon?
        time.wednesday? && before_noon?
      end

      def thursday_or_friday?
        time.thursday? || time.friday?
      end

      def thursday?
        time.thursday?
      end

      def before_noon?
        time <= time.noon
      end

      def after_noon?
        time > time.noon
      end

      def time
        Time.current
      end

      def today
        Date.today
      end
    end
  end
end
