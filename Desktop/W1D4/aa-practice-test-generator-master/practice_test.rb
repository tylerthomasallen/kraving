# CHALLENGE: Eight queens puzzle precursor
#
# Write a recursive method that generates all 8! possible unique ways to
# place eight queens on a chess board such that no two queens are in
# the same board row or column (the same diagonal is OK).
#
# Each of the 8! elements in the return array should be an array of positions:
# E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
#
# My solution used 3 method parameters: current_row, taken_columns, and
# positions so far
def eight_queens_possibilities(current_row, taken_columns, positions)

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |n|
    return true if num % n == 0
  end
  false
end

def primes(num)
  result = []
  until result.length == num
    i = 2
    result << i if is_prime?(i)
    i += 1
  end
  result
end

class Array

  def my_reverse

  end

end

class Array
  def bubble_sort!(&prc)
  end

  def bubble_sort(&prc)
  end
end
