require 'spec_helper'

describe Height::Parser do
  describe '#centimeters' do
    it { Height::Parser.new(191).centimeters.should == Height::Units::Centimeters.new(191) }
    it { Height::Parser.new('1.91').centimeters.should == Height::Units::Centimeters.new(191) }
    it { Height::Parser.new('1m 91cm').centimeters.should == Height::Units::Centimeters.new(191) }
    it { Height::Parser.new('6 feet 3 inches').centimeters.should == Height::Units::Centimeters.new(191) }
  end
end
