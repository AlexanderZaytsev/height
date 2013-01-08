require 'height'
require 'pry'
require 'i18n'

def reset_i18n
  I18n.backend = I18n::Backend::Simple.new
end

def units
[
  Height::Units::Feet.new(6.25),
  Height::Units::Inches.new(75),
  Height::Units::Meters.new(1.91),
  Height::Units::Centimeters.new(191)
]
end