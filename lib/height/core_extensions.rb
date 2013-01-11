class Numeric
  def to_height
    Height.new(self)
  end
end

class String
  def to_height
    Height.new(self)
  end
end