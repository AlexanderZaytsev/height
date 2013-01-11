require 'spec_helper'

describe Height::Units::Centimeters do

  describe 'converts to' do
    before do
      @centimeters = Height::Units::Centimeters.new(191)
    end

    it 'centimeters' do
      @centimeters.to_centimeters.should === @centimeters
    end

    it 'meters' do
      @centimeters.to_meters.should == Height::Units::Meters.new(1.91)
    end

    it 'inches' do
      @centimeters.to_inches.should == Height::Units::Inches.new(75)
    end

    it 'feet' do
      @centimeters.to_feet.should == Height::Units::Feet.new(6.25)
    end

    it 'string' do
      Height::Units::Centimeters.new(191.0).to_s.should == '191'
    end
  end

  it 'rounds the value to 0 digit precision' do
    Height::Units::Centimeters.new(191.51).value.should == 192
  end

end

