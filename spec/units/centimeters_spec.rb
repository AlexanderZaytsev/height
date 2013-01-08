require 'spec_helper'

describe Height::Units::Centimeters do

  describe 'converting' do
    before do
      @centimeters = Height::Units::Centimeters.new(191)
    end

    it 'to centimeters' do
      @centimeters.to_centimeters.should === @centimeters
    end

    it 'to meters' do
      @centimeters.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'to inches' do
      @centimeters.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'to feet' do
      @centimeters.to_feet.should == Height::Units::Feet.new(6.25)
    end
  end

  it 'can be created from string' do
    Height::Units::Centimeters.new('191').should == Height::Units::Centimeters.new(191)
  end

  it 'to string' do
    Height::Units::Centimeters.new(191.55).to_s.should == '192'
    Height::Units::Centimeters.new(191.0).to_s.should == '191'
  end

end

