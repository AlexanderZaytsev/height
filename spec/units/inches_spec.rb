require 'spec_helper'

describe Height::Units::Inches do

  describe 'converting' do
    before do
      @inches = Height::Units::Inches.new(75)
    end

    it 'to inches' do
      @inches.to_inches.should === @inches
    end

    it 'to feet' do
      @inches.to_feet.should == Height::Units::Feet.new(6.25)
    end

    it 'to centimeters' do
      @inches.to_centimeters.should == Height::Units::Centimeters.new(190.5)
    end

    it 'to meters' do
      @inches.to_meters.should == Height::Units::Meters.new(1.91)
    end
  end

  it 'can be created from string' do
    Height::Units::Inches.new('72.4').should == Height::Units::Inches.new(72.4)
  end

  it 'to string' do
    Height::Units::Inches.new(75.0).to_s.should == '75'
    Height::Units::Inches.new(72.4).to_s.should == '72'
  end
end

