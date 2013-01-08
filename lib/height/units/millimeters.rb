class Height
  module Units
    class Millimeters < Base

      def to_millimeters
        self
      end

      def to_centimeters
        centimeters = value / Height::MILLIMETERS_IN_CENTIMETER.to_f
        Centimeters.new(centimeters)
      end

      def to_meters
        meters = value / Height::MILLIMETERS_IN_METER.to_f
        Meters.new(meters)
      end

      def to_inches
        inches = value / Height::MILLIMETERS_IN_INCH.to_f
        Inches.new(inches)
      end

      def to_feet
        to_inches.to_feet
      end

      private
        def self.format_value(value)
          value.to_f.round
        end
    end
  end
end