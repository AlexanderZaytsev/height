require 'spec_helper'

describe Height::Units::Meters do

  describe 'converts to' do
    before do
      @meters = Height::Units::Meters.new(1.91)
    end

    it 'meters' do
      @meters.to_meters.should === @meters
    end

    it 'centimeters' do
      @meters.to_centimeters.should == Height::Units::Centimeters.new(191)
    end

    it 'inches' do
      @meters.to_inches.should == Height::Units::Inches.new(75.2)
    end

    it 'feet' do
      @meters.to_feet.should == Height::Units::Feet.new(6.25)
    end

    it 'string' do
      Height::Units::Meters.new(1.914).to_s.should == '1.91'
      Height::Units::Meters.new(2.0).to_s.should == '2'
    end
  end

  it 'has meters' do
    Height::Units::Meters.new(1.91).meters.should == Height::Units::Meters.new(1)
    Height::Units::Meters.new(1.41).meters.should == Height::Units::Meters.new(1)
  end

  it 'has centimeters' do
    Height::Units::Meters.new(1.91).centimeters.should == Height::Units::Centimeters.new(91)
  end

  it 'rounds the value to 2 digit precision' do
    Height::Units::Meters.new(1.914).value.should == 1.91
  end
end

