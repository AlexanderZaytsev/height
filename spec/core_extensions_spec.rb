require 'spec_helper'


describe Numeric do
  describe '#to_height' do
    it { 191.to_height.should == Height.new(191) }
    it { 191.5.to_height.should == Height.new(191.5) }
  end
end

describe String do
  describe '#to_height' do
    it { '191 cm'.to_height.should == Height.new(191) }
  end
end