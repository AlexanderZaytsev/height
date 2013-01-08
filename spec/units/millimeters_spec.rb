require 'spec_helper'

describe Height::Units::Millimeters do

  describe 'converting' do
    before do
      @millimeters = Height::Units::Millimeters.new(1910)
    end

    it 'to millimeters' do
      @millimeters.to_millimeters.should === @millimeters
    end

    it 'to centimeters' do
      @millimeters.to_centimeters.should == Height::Units::Centimeters.new(191)
    end

    it 'to meters' do
      @millimeters.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'to inches' do
      @millimeters.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'to feet' do
      @millimeters.to_feet.should == Height::Units::Feet.new(6.25)
    end
  end

  it 'can be created from string' do
    Height::Units::Millimeters.new('191').should == Height::Units::Millimeters.new(191)
  end

  it 'to string' do
    Height::Units::Millimeters.new(1.6).to_s.should == '2'
    Height::Units::Millimeters.new(1.0).to_s.should == '1'
  end

end

