require 'spec_helper'

describe Height do
  it 'is comparable' do
    Height.new(191).should > Height.new(190)
    Height.new(191).should == Height.new(191)
  end

  describe '.system_of_units' do
    it 'can be changed in Height class' do
      Height.system_of_units = :imperial
      Height.new(191).to_s.should == '6 ft 3 in'
      Height.system_of_units = :metric
    end
  end

  it '+' do
    (Height.new(200) + Height.new(10)).should == Height.new(210)
  end

  it '-' do
    (Height.new(200) - Height.new(10)).should == Height.new(190)
  end

  describe '#initialize' do
    it 'accepts Height::Units' do
      centimeters = Height::Units::Centimeters.new(191)

      Height.new(centimeters).centimeters.should == centimeters
    end
  end

  describe '#to_s' do
    it 'works without arguments' do
      Height.new(191).to_s.should == '1m 91cm'
    end

    it 'formats with metric system' do
      Height.new(191).to_s(:default, :metric).should == '1m 91cm'
    end

    it 'formats with imperial system' do
      Height.new('6ft 3in').to_s(:default, :imperial).should == '6 ft 3 in'
    end

    it 'raises when invalid system provided' do
      expect { Height.new(191).to_s(:default, :alien) }.to raise_error(ArgumentError)
    end

  end
end
