require 'spec_helper'

describe Height::Units::Millimeters do

  describe 'converts to' do
    before do
      @millimeters = Height::Units::Millimeters.new(1905)
    end

    it 'millimeters' do
      @millimeters.to_millimeters.should === @millimeters
    end

    it 'centimeters' do
      @millimeters.to_centimeters.should == Height::Units::Centimeters.new(191)
    end

    it 'meters' do
      @millimeters.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'inches' do
      @millimeters.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'feet' do
      @millimeters.to_feet.should == Height::Units::Feet.new(6.25)
    end

    it 'string' do
      Height::Units::Millimeters.new(1.6).to_s.should == '2'
      Height::Units::Millimeters.new(1.0).to_s.should == '1'
    end
  end

  it 'rounds the value to 0 digit precision' do
    Height::Units::Millimeters.new(1914.5).value.should == 1915
  end

end

