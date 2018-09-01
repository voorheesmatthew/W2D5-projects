class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true
    false
  end

  private

  def is_valid?(num)
    
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
    # p @store
  end

  def remove(num)
    self[num].delete(num)
    # end
  end

  def include?(num)
    self[num].each do |n|
      return true if n == num
    end
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      self[num] << num unless self.include?(num)
      @count += 1
      @store = resize! 
    end
    
    unless self.include?(num)
      self[num] << num 
      @count += 1
    end
    
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].each do |n|
      return true if n == num
    end
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    new_store = Array.new(num_buckets * 2) {Array.new}
    
    @store.each do |bucket|
      bucket.each do |element|
        new_store[element % new_store.length] << element
      end
    end
    
    new_store
    
    # num_buckets = num_buckets * 2
    # ResizingIntSet.new(num_buckets)
    # @count = 0
  end
end
