require 'spec_helper'

describe Height::Parsers::Imperial do
  it { Height::Parsers::Imperial.new('6 feet 3 inches').inches.should == Height::Units::Inches.new(75) }
  it { Height::Parsers::Imperial.new('6 feet').centimeters.should == Height::Units::Centimeters.new(183) }
  it { Height::Parsers::Imperial.new('6 \'').meters.should == Height::Units::Meters.new(1.83) }
  it { Height::Parsers::Imperial.new('6\' 3"').feet.should == Height::Units::Feet.new(6.25) }
  it { Height::Parsers::Imperial.new('6ft 3in').feet.should == Height::Units::Feet.new(6.25) }
end
