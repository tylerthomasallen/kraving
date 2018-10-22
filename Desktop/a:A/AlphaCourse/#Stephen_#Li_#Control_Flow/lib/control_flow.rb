# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  ans = ''
  str.chars.each do |el|
    if el == el.upcase
      ans << el
    end
  end
  ans

end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length.odd?
    str[(str.length / 2)]
  else
    str[((str.length - 1) / 2) .. ((str.length - 1) / 2) + 1 ]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0
  i = 0
  while i < str.length
    if VOWELS.include?(str[i].downcase)
      count += 1
    end
    i += 1
  end
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  ans = []
  (1..num).each do |n|
    ans << n
  end
  ans.reduce(:*)
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  join = ''

  arr.each_index do |i|
    join += arr[i]
    join += separator unless i == arr.length - 1
  end
  join
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  i = 0
  ans = ''
  while i < str.length
    if i.even?
      ans << str[i].downcase
    else
      ans << str[i].upcase
    end
    i += 1
  end
  ans
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split(" ")
  ans = []
  i = 0
  while i < arr.length
    if arr[i].length >= 5
      ans << arr[i].reverse
    else
      ans << arr[i]
    end
    i += 1
  end
  ans.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  ans = []
  i = 1
  while i < n + 1
    if i % 5 == 0 && i % 3 == 0
      ans << "fizzbuzz"
    elsif i % 3 == 0
      ans << "fizz"
    elsif i % 5 == 0
      ans << "buzz"
    else
      ans << i
    end

    i += 1
  end
  ans
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse

end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  i = 1
  ans = []
  while i < num + 1
    if num % i == 0
      ans << i
    end
    i += 1
  end

  if ans.length == 2
    true
  else
    false
  end

end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  i = 1
  ans = []
  while i < num + 1
    if num % i == 0
      ans << i
    end
    i += 1
  end
  ans
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  arr = factors(num)
  ans = []
  i = 0
  while i < arr.length
    if prime?(arr[i])
      ans << arr[i]
    end
    i += 1
  end
  ans
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  ans = prime_factors(num)
  ans.length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even = []
  odd = []
  i = 0
  while i < arr.length
    if arr[i].even?
      even << arr[i]
    else
      odd << arr[i]
    end
    i += 1
  end
  if even.length == 1
    even[0]
  else
    odd[0]
  end

end
