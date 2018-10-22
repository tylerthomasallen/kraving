require 'byebug'

class Array
  def my_select(&blk)
    result = []
    i = 0
    while i < length
      result << self[i] if blk.call(self[i])
      i += 1
    end
    result
  end
end

class Array
  def my_map(&blk)
    result = []
    i = 0
    while i < length
      result << blk.call(self[i])
      i += 1
    end
    result
  end
end


class Array
  def my_find(&blk)
    i = 0
    while i < length
      if blk.call(self[i]) == true
        return self[i]
      end
      i += 1
    end
    nil
  end
end


class Array
  def my_any?(&prc)
    self.each do |el|
      return !false if prc.call(el)
    end

    !true
  end
end


class Array
  def my_all?(&blk)
    self.each { |el| return false unless blk.call(el) }
    true
  end
end


class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    elements = Hash.new(false) #hash
    self.each do |item|
      return true if elements[item]
      elements[item] = true
    end
    false
  end
end


class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.
  def my_merge(hash2 , &prc)
    hash2.each do |k, v| #test_hash_2
      # debugger
      if self[k] #test_hash_1
        if !prc.nil?
          self[k] = prc.call(k , self[k] , v)
        else
          self[k] = v
        end
      else
        self[k] = v
      end
    end
    self
  end
end
