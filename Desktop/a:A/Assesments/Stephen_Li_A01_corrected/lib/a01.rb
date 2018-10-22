# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr == []
  mid = arr.length / 2
  return mid if target == arr[mid]

  # should have used a rocket ship to compare the sides of the array
  # left = binary_search(arr[0...mid], target)
  # right = binary_search(arr[mid + 1 .. -1], target)

  if (arr[mid] <=> target) == 1
    binary_search(arr.take(mid), target)
  else
    ans = binary_search(arr.drop(mid + 1), target)
    ans + mid + 1 if ans != nil
    # result.nil? nil : result + 1 + mid
  end

end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    i = 0
    ans = []
    while i < self.length - 1
      j = i + 1
      while j < self.length
        if self[i] + self[j] == target
          ans << [i, j]
        end
        j += 1
      end
      i += 1
    end
    ans
  end

end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  # nums.reduce(:+)
  #needed to use recursion
  return 0 if nums == []
  return nums.first if nums.length == 1
  # p nums
  sum_rec(nums.drop(1)) + nums.first
end

class String
  # Write a method that finds all the unique substrings for a word

  def uniq_subs
    ans = []
    i = 0
    while i < length
      j = i
      while j < length
        ans << self[i..j]
        j += 1
      end
      i += 1
    end
    ans.uniq
  end
end

def prime?(num)
  return false if num <= 1
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  return 0 if n == 0
  return 1 if n == 2
  ans = []
  i = 2

  while ans.length < n
    ans << i if prime?(i)
    i += 1
  end

  p ans
  ans.reduce(:+)
  #THOUGHT I had to use recursion!!!
  # until array_of_prime.length == (n - 2)
  #   array_of_prime << i if prime?(i)
  #   array_of_prime
  #   i += 1
  # end

# p (sum_n_primes(n - 1) + array_of_prime[n - 2])
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
      while i < length
        prc.call(self[i])
        i += 1
      end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
    ans = []
    self.each {|el| ans << prc.call(el)}
    ans
  end
end
