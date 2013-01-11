require 'spec_helper'

describe Height::Units::Feet do

  describe 'converts to' do
    before do
      @feet = Height::Units::Feet.new(6.25)
    end

    it 'feet' do
      @feet.to_feet.should === @feet
    end

    it 'inches' do
      @feet.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'centimeters' do
      @feet.to_centimeters.should == Height::Units::Centimeters.new(190.5)
    end

    it 'meters' do
      @feet.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'string' do
      Height::Units::Feet.new(6.25).to_s.should == '6.25'
      Height::Units::Feet.new(6.0).to_s.should == '6'
    end
  end

  it 'has feet' do
    Height::Units::Feet.new(6.25).feet.should == Height::Units::Feet.new(6)
    Height::Units::Feet.new(6.75).feet.should == Height::Units::Feet.new(6)
  end

  it 'has inches' do
    Height::Units::Feet.new(6.25).inches.should == Height::Units::Inches.new(3)
  end



  it 'rounds the value to 2 digit precision' do
    Height::Units::Feet.new(6.251).value.should == 6.25
  end
end

