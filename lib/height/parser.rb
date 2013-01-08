class Height
  class Parser
    def initialize(input)
      @input = input

      metric_parser = Parsers::Metric.new(@input)
      imperial_parser = Parsers::Imperial.new(@input)

      if metric_parser.parsed?
        @millimeters = metric_parser.millimeters
      elsif imperial_parser.parsed?
        @millimeters = imperial_parser.inches.to_millimeters
      else
        raise ArgumentError.new("Could not parse `#{@input}` into valid height")
      end
    end

    def millimeters
      @millimeters
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
      millimeters.to_feet
    end
  end
end