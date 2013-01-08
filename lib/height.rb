require "height/parser"
require "height/parsers/base"
require "height/parsers/metric"
require "height/parsers/imperial"
require "height/formatters/base"
require "height/formatters/imperial"
require "height/formatters/metric"
require "height/units/base"
require "height/units/millimeters"
require "height/units/centimeters"
require "height/units/meters"
require "height/units/inches"
require "height/units/feet"
require "height/version"
require "height/core_extensions"

class Height
  include Comparable

  MILLIMETERS_IN_CENTIMETER = 10
  MILLIMETERS_IN_METER = 1000
  CENTIMETERS_IN_METER = 100
  MILLIMETERS_IN_INCH = 25.4
  INCHES_IN_FOOT = 12

  attr_reader :centimeters

  class << self
    attr_accessor :system_of_units
  end

  self.system_of_units = :metric

  def initialize(input)
    @centimeters = Parser.new(input).centimeters
  end

  def meters
    centimeters.to_meters
  end

  def inches
    centimeters.to_inches
  end

  def feet
    centimeters.to_feet
  end

  def <=>(other)
    centimeters <=> other.centimeters
  end

  def to_s(format = :default, system_of_units = nil)
    system_of_units ||= self.class.system_of_units

    case system_of_units
    when :metric
      Formatters::Metric.new(centimeters).format(format)
    when :imperial
      Formatters::Imperial.new(centimeters).format(format)
    else
      raise ::ArgumentError.new('Invalid system of units provided, use either :metric or :imperial')
    end
  end

end
