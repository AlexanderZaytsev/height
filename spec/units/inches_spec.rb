require 'spec_helper'

describe Height::Units::Inches do

  describe 'converts to' do
    before do
      @inches = Height::Units::Inches.new(75)
    end

    it 'inches' do
      @inches.to_inches.should === @inches
    end

    it 'feet' do
      @inches.to_feet.should == Height::Units::Feet.new(6.25)
    end

    it 'centimeters' do
      @inches.to_centimeters.should == Height::Units::Centimeters.new(190.5)
    end

    it 'meters' do
      @inches.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'string' do
      Height::Units::Inches.new(75.0).to_s.should == '75'
      Height::Units::Inches.new(72.4).to_s.should == '72'
    end
  end



  it 'rounds the value to 0 digit precision' do
    Height::Units::Inches.new(72.4).value.should == 72
  end

end

