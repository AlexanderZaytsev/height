class Height
  module Units
    class Base
      include Comparable

      attr_reader :value

      def initialize(value)
        @value = self.class.round_value(value)
      end

      def <=>(other)
        value <=> other.to(self.class).value
      end

      def +(other)
        result = value + other.to(self.class).value
        self.class.new(result)
      end

      def -(other)
        result = value - other.to(self.class).value
        self.class.new(result)
      end

      def *(other)
        result = value * other.to(self.class).value
        self.class.new(result)
      end

      def /(other)
        result = value / other.to(self.class).value
        self.class.new(result)
      end

      def to(klass)
        class_name = klass.name.split('::').last.downcase
        method = "to_#{class_name}"
        send(method)
      end

      def to_s
        "%g" % ("%0.2f" % value)
      end
    end
  end
end