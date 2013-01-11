class Height
  module Units
    class Feet < Base

      def to_feet
        self
      end

      def to_inches
        inches = value * Height::INCHES_IN_FOOT
        Inches.new(inches)
      end

      def to_millimeters
        to_inches.to_millimeters
      end

      def to_centimeters
        to_millimeters.to_centimeters
      end

      def to_meters
        to_millimeters.to_meters
      end

      def feet
        self.class.new(value.floor)
      end

      def inches
        inches = value.modulo(1) * Height::INCHES_IN_FOOT
        Inches.new(inches)
      end

      private
        def self.round_value(value)
          value.round(2)
        end

    end
  end
end