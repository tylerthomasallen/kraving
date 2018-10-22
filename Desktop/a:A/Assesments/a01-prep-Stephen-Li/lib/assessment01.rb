require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  # def my_inject(accumulator = nil, &block)
  #   i = 0
  #
  #   if accumulator == nil
  #     accumulator = self.first
  #     i += 1
  #   end
  #
  #   while i < length
  #     accumulator = block.call(accumulator, self[i])
  #     i += 1
  #   end
  #   accumulator
  # end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  result = []
  i = 2
  while result.length < num
    result << i if is_prime?(i)
    i += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num == 0
  return [1] if num == 1
  facs = factorials_rec(num -1)
  facs << (num - 1) * facs.last
  facs
  # if num == 1
  #   [1]
  # else
  #   facs = factorials_rec(num - 1)
  #   facs << facs.last * (num - 1)
  #   facs
  # end

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    ans = Hash.new([])
    self.each_with_index do |el, idx|
      ans[el] += [idx]
      # p ans
      # ans.select! {|k,v| ans[k].length == 2}
    end
    ans.select! {|k,v| ans[k].length > 1}
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        palindrone = self[i..j]
        result << palindrone if palindrone == palindrone.reverse
        j += 1
      end
      i += 1
    end
    result
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x<=>y }
    return self if count <= 1
    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)

    # prc ||= Proc.new { |x,y| x<=> y}
    #
    # return self if count <= 1
    #
    # mid = count / 2
    # sorted_left = self.take(mid).merge_sort(&prc)
    # sorted_right = self.drop(mid).merge_sort(&prc)
    #
    # Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merge = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merge << right.shift
      else
        merge << left.shift
      end
    end
    merge + left + right
  end



    # merged = []
    #
    # until left.empty? || right.empty?
    #   if prc.call(left.first, right.first) == 1
    #     merged << right.shift
    #   else
    #     merged << left.shift
    #   end
    # end
    # merged + left + right

  
end
