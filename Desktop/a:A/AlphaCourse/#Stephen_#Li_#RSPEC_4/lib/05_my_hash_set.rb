class MyHashSet
  attr_reader :store

  def initialize
    @store = {}
  end

  def insert(el)
    store[el] = true
  end

  def include?(el)
    store.has_key?(el)
  end

  def delete(el)
    store.delete(el)
  end

  def to_a
    store.keys.to_a
  end

  def union(set2)
    new_set = MyHashSet.new
    self.to_a.each { |el| new_set.insert(el)}
    set2.to_a.each { |el| new_set.insert(el)}
    new_set
  end

  def intersect(set2)
    new_set = MyHashSet.new
      self.to_a.each do |el|
        new_set.insert(el) if set2.to_a.include?(el)
      end
      new_set
    end

    def minus(set2)
      new_set = MyHashSet.new
      self.to_a.each do |el|
        new_set.insert(el) unless set2.include?(el)
      end
      new_set
    end
end
