class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # mid = self.length / 2
    # drop(mid) + take(mid)
    # # self.to_s.to_i
    # self.rotate(self.length - 1) 
    # * self.reduce(:-)
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
    0
  end
end
