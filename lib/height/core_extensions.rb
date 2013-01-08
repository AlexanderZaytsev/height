class Numeric
  def to_height
    Height.new(self)
  end

  def to_centimeters
    Height::Units::Centimeters.new(self)
  end
end

class String
  def to_height
    Height.new(self)
  end

  def to_centimeters
    Height::Units::Centimeters.new(self)
  end
end