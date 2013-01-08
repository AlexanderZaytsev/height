require 'spec_helper'

describe Height::Units::Meters do

  describe 'converting' do
    before do
      @meters = Height::Units::Meters.new(1.91)
    end

    it 'to meters' do
      @meters.to_meters.should === @meters
    end

    it 'to centimeters' do
      @meters.to_centimeters.should == Height::Units::Centimeters.new(191)
    end

    it 'to inches' do
      @meters.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'to feet' do
      @meters.to_feet.should == Height::Units::Feet.new(6.25)
    end
  end

  it 'can be created from string' do
    Height::Units::Meters.new('1.91').should == Height::Units::Meters.new(1.91)
  end

  it 'has meters' do
    Height::Units::Meters.new(1.91).meters.should == Height::Units::Meters.new(1)
    Height::Units::Meters.new(1.41).meters.should == Height::Units::Meters.new(1)
  end

  it 'has centimeters' do
    Height::Units::Meters.new(1.91).centimeters.should == Height::Units::Centimeters.new(91)
  end

  it 'to string' do
    Height::Units::Meters.new(1.914).to_s.should == '1.91'
    Height::Units::Meters.new(2.0).to_s.should == '2'
  end
end

