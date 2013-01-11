require 'spec_helper'

describe Height::Units::Base do

  describe '#to_unit' do
    it 'converts unit into another unit' do
      @centimeters = Height::Units::Centimeters.new(41)

      @centimeters.to_unit(Height::Units::Meters).should == Height::Units::Meters.new(0.41)
    end
  end

  describe '==' do
    it { Height::Units::Meters.new(1.5).should == Height::Units::Centimeters.new(150) }
    it { Height::Units::Centimeters.new(127).should == Height::Units::Inches.new(50) }
    it { Height::Units::Feet.new(6).should == Height::Units::Centimeters.new(183) }
  end

  describe '+' do
    before do
      @meters = Height::Units::Meters.new(1.5)
      @centimeters = Height::Units::Centimeters.new(41)
    end

    it 'adds other unit' do
      (@meters + @centimeters).should == Height::Units::Meters.new(1.91)
    end

    it 'adds numeric object' do
      (@meters + 0.5).should == Height::Units::Meters.new(2)
    end

    it 'returns instance of the class of the first unit' do
      (@meters + @centimeters).class.should == Height::Units::Meters
    end
  end

  describe '-' do
    before do
      @feet = Height::Units::Feet.new(6.25)
      @inches = Height::Units::Inches.new(3)
    end

    it 'substracts other unit' do
      (@feet - @inches).should == Height::Units::Feet.new(6)
    end

    it 'substracts numeric objects' do
      (@feet - 0.25).should == Height::Units::Feet.new(6)
    end

    it 'returns instance of the class of the first unit' do
      (@feet + @inches).class.should == Height::Units::Feet
    end
  end

  describe '*' do
    before do
      @meters = Height::Units::Meters.new(2)
      @centimeters = Height::Units::Centimeters.new(200)
    end

    it 'multiplies by other unit' do
      (@meters * @centimeters).should == Height::Units::Meters.new(4)
    end

    it 'multiplies by numeric object' do
      (@meters * 2).should == Height::Units::Meters.new(4)
    end

    it 'returns instance of the class of the first unit' do
      (@meters * @centimeters).class.should == Height::Units::Meters
    end
  end

  describe '/' do
    before do
      @meters = Height::Units::Meters.new(2)
      @centimeters = Height::Units::Centimeters.new(200)
    end

    it 'divides by other unit' do
      (@meters / @centimeters).should == Height::Units::Meters.new(1)
    end

    it 'divides by numeric object' do
      (@meters / 2).should == Height::Units::Meters.new(1)
    end

    it 'returns instance of the class of the first unit' do
      (@meters / @centimeters).class.should == Height::Units::Meters
    end
  end
end
