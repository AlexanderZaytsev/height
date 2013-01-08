require 'spec_helper'

describe Height::Units::Base do
  describe '#to' do
    it 'converts unit into another unit' do
      @centimeters = Height::Units::Centimeters.new(41)

      @centimeters.to(Height::Units::Meters).should == Height::Units::Meters.new(0.41)
    end
  end

  describe '==' do
    it { Height::Units::Meters.new(1.5).should == Height::Units::Centimeters.new(150) }
    it { Height::Units::Centimeters.new(127).should == Height::Units::Inches.new(50) }
    it { Height::Units::Feet.new(6).should == Height::Units::Centimeters.new(183) }
  end

  describe '+' do
    it 'adds' do
      @meters = Height::Units::Meters.new(1.5)
      @centimeters = Height::Units::Centimeters.new(41)
      (@meters + @centimeters).should == Height::Units::Meters.new(1.91)
      (@meters + @centimeters).class.should == Height::Units::Meters
    end
  end

  describe '-' do
    it 'substracts' do
      @feet = Height::Units::Feet.new(6.25)
      @inches = Height::Units::Inches.new(3)
      (@feet - @inches).should == Height::Units::Feet.new(6)
    end
  end

  describe '*' do
    it 'multiplies' do
      @meters = Height::Units::Meters.new(2)
      @centimeters = Height::Units::Centimeters.new(200)
      (@meters * @centimeters).should == Height::Units::Meters.new(4)
    end
  end

  describe '/' do
    it 'divides' do
      @meters = Height::Units::Meters.new(2)
      @centimeters = Height::Units::Centimeters.new(200)
      (@meters / @centimeters).should == Height::Units::Meters.new(1)
    end
  end

end
