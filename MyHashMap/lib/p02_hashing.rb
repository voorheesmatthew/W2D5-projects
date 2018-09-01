class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  self.join.to_i
  end
end

class String
  def hash
    alpha = ("a".."z").to_a
    convert = []
    
    self.each_char { |chr| convert << alpha.index(chr) }
    convert.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    t = []
    self.to_a.sort.to_s.each_char {|el| t << el.ord}
    t.join.to_i * 2
  end
end
