class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      self[key] << key unless self.include?(key)
      @count += 1
      @store = resize! 
    end
    
    unless self.include?(key)
      self[key] << key 
      @count += 1
    end
    
  
  end

  def include?(key)
    self[key].each do |n|
      return true if n == key
    end
    false
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
  end
end
