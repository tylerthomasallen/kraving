# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  arr.sort[-1] - arr.sort[0]# your code goes here
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort# your code goes here
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  count = 0
  vowel = 'aeiou'
  i = 0
  while i < str.length
    if vowel.include?(str[i].downcase)
      count += 1
    end
    i += 1
  end
  count # your code goes here
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  ans = ''
  vowels = 'aeiou'
  i = 0
  while i < str.length
    if vowels.include?(str[i].downcase)
      ans
    else
      ans << str[i]
    end
    i += 1
  end
  ans
  # your code goes here
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  int.to_s.chars.sort.reverse
  # your code goes here
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  str.downcase.chars.uniq.length != str.length
  # your code goes here
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  zip = arr[0..2].join
  first = arr[3..5].join
  last = arr[6..9].join
  "(#{zip}) #{first}-#{last}"
  # your code goes here
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  arr = str.split(",").sort
  arr[-1].to_i - arr[0].to_i
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  i = offset % arr.length
  arr.drop(i) + arr.take(i)
  # your code goes here
end
