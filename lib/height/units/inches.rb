class Height
  module Units
    class Inches < Base

      def to_inches
        self
      end

      def to_millimeters
        millimeters = value * Height::MILLIMETERS_IN_INCH
        Millimeters.new(millimeters)
      end

      def to_centimeters
        to_millimeters.to_centimeters
      end

      def to_meters
        to_centimeters.to_meters
      end

      def to_feet
        feet = value / Height::INCHES_IN_FOOT.to_f
        Feet.new(feet)
      end

      private
        def self.format_value(value)
          value.to_f.round
        end
    end
  end
end