class Height
  module Units
    class Centimeters < Base

      def to_millimeters
        millimeters = value * MILLIMETERS_IN_CENTIMETER
        Millimeters.new(millimeters)
      end

      def to_centimeters
        self
      end

      def to_meters
        to_millimeters.to_meters
      end

      def to_inches
        to_millimeters.to_inches
      end

      def to_feet
        to_inches.to_feet
      end

      private
        def self.round_value(value)
          value.round(1)
        end
    end
  end
end