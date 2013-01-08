class Height
  module Parsers
    class Base
      attr_reader :input, :value

      def initialize(input)
        @input = input
        @value = self.class.parse(input)
      end

      def parsed?
        @value
      end
    end
  end
end