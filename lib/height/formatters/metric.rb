class Height
  module Formatters
    class Metric < Base
      def format(format = :default)
        meters = @value.to_meters

        result = "#{meters.meters}m #{meters.centimeters}cm"

        if Object.const_defined?(:I18n)
          ::I18n.t :"height.format.metric.#{format}", {
            meters: meters.meters,
            centimeters: meters.centimeters,
            only_meters: meters,
            only_centimeters: meters.to_centimeters,
            default: result
          }
        else
          result
        end
      end

    end
  end
end
