require 'spec_helper'

describe Height::Parsers::Metric do
  it { Height::Parsers::Metric.new(191).centimeters.should == Height::Units::Centimeters.new(191) }
  it { Height::Parsers::Metric.new('191').centimeters.should == Height::Units::Centimeters.new(191) }
  it { Height::Parsers::Metric.new('191 cm').centimeters.should == Height::Units::Centimeters.new(191) }
  it { Height::Parsers::Metric.new('1m 91cm').inches.should == Height::Units::Inches.new(75) }
  it { Height::Parsers::Metric.new('1m').meters.should == Height::Units::Meters.new(1) }
end
