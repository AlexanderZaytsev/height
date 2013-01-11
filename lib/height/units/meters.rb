class Height
  module Units
    class Meters < Base

      def to_millimeters
        millimeters = value * MILLIMETERS_IN_METER
        Millimeters.new(millimeters)
      end

      def to_centimeters
        to_millimeters.to_centimeters
      end

      def to_meters
        self
      end

      def to_inches
        to_centimeters.to_inches
      end

      def to_feet
        to_inches.to_feet
      end

      def meters
        Meters.new(value.floor)
      end

      def centimeters
        millimeters = (to_millimeters.value - meters.to_millimeters.value)

        Millimeters.new(millimeters).to_centimeters
      end

    end
  end
end