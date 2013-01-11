class Height
  module Units
    class Base
      include Comparable
      include Math
      attr_reader :value

      def self.round_value(value)
        key = self.name.split('::').last.downcase.to_sym

        precision = ::Height.units_precision[key]

        value.round(precision)
      end

      def initialize(value)
        @value = self.class.round_value(value)
      end

      def <=>(other)
        value <=> other_value(other)
      end

      def +(other)
        result = value + other_value(other)
        self.class.new(result)
      end

      def -(other)
        result = value - other_value(other)

        self.class.new(result)
      end

      def *(other)
        result = value * other_value(other)
        self.class.new(result)
      end

      def /(other)
        result = value / other_value(other)
        self.class.new(result)
      end

      def to_unit(klass)
        class_name = klass.name.split('::').last.downcase
        method = "to_#{class_name}"
        send(method)
      end

      def to_s
        "%g" % ("%0.2f" % value)
      end

      private
        def other_value(other)
          if other.respond_to? :to_unit
            other.to_unit(self.class).value
          else
            other
          end
        end

    end
  end
end