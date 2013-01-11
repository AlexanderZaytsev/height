class Height
  module Parsers
    class Metric < Base

      def millimeters
        Height::Units::Millimeters.new(value)
      end

      def centimeters
        millimeters.to_centimeters
      end

      def meters
        millimeters.to_meters
      end

      def inches
        millimeters.to_inches
      end

      def feet
        inches.to_feet
      end

      def self.parse(input)
        if input.is_a? Integer
          parse_integer(input)
        elsif input.is_a? Float
          parse_float(input)
        elsif input.is_a? String
          parse_string(input)
        end
      end

      private
        # 191.5
        def self.parse_float(float)
          (float * MILLIMETERS_IN_CENTIMETER).to_i
        end

        # 191
        def self.parse_integer(integer)
          (integer * MILLIMETERS_IN_CENTIMETER).to_i
        end

        # 1.91, 1m 91cm, 191, 191 cm
        def self.parse_string(string)
          if string =~ /[0-9]+\.[0-9]+/
            parse_float(string.to_f)
          elsif (Float(string) != nil rescue false)
            parse_integer(string.to_i)
          else
            match = string.match(/(?:([0-9]+)\s?m)?[^0-9]*(?:([0-9]+)\s?cm)?/)
            if match[1] || match[2]
              match[1].to_i * MILLIMETERS_IN_METER + match[2].to_i * MILLIMETERS_IN_CENTIMETER
            end
          end
        end

    end
  end
end