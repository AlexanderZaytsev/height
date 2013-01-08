class Height
  module Parsers
    class Imperial < Base

      def inches
        Height::Units::Inches.new(value)
      end

      def feet
        inches.to_feet
      end

      def millimeters
        inches.to_millimeters
      end

      def centimeters
        inches.to_centimeters
      end

      def meters
        inches.to_meters
      end

      def self.parse(input)
        parse_string(input) if input.is_a? String
      end

      private

        def self.parse_string(string)
          match = string.match(/(\d+)\s*(?:'|ft|feet)(?:\s*(\d+)\s*(?:"|in|inches))?/)
          if match
            match[1].to_i * INCHES_IN_FOOT + match[2].to_i
          end
        end

    end
  end
end