class Height
  module Formatters
    class Imperial < Base
      def format(format = :default)
        feet = @value.to_feet

        result = "#{feet.feet} ft #{feet.inches} in"
        if Object.const_defined?(:I18n)
          ::I18n.t :"height.format.imperial.#{format}", {
            feet: feet.feet,
            inches: feet.inches,
            only_feet: feet,
            only_inches: feet.to_inches,
            default: result
          }
        else
          result
        end
      end

    end
  end
end
