# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  arr = []
  (nums[0]..nums[-1]).each do |n|
    if !nums.include?(n)
      arr << n
    end
  end
  arr
end

# Write a method that returns the nth prime number
def nth_prime(n)
  i = 2
  ans = []
  while n > ans.length
    if is_prime?(i)
      ans << i
      i += 1
    else
      i += 1
    end
  end
  ans.last

end

def is_prime?(num)
  ans = []
  (2...num).each do |n|
    if num % n == 0
      ans << n
    end
  end
  ans == []
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    result = {}
    self.each { |k , v| result[k] = v if prc.call(k , v) }
    result

  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  ans = 0
  i = 0
  while i < string.length - 1
    j = i + 1
    while j < string.length
      word = string[i..j]
      if word == word.reverse && word.length > ans
        ans = word.length
      end
      j += 1
    end
    i += 1
  end
  if ans > 2
    ans
  else
    false
  end

end



class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.count
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)

  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat
  attr_reader :name

  def initialize(name = nil)
    @name = name
  end

  def meow
    "meow"
  end

  def receive_love
    self.meow
  end
end

class Dog
  attr_reader :breed
  attr_accessor :name
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def play_with(thing)
    thing.receive_love
  end

  def self.make_a_pup
    Dog.new(name, BREEDS.sample)
  end

end

class Human
  attr_accessor :owner

  def initialize(owner)
    @owner = owner
    @happy = false
  end

  def happy?
    @happy
  end

  def receive_love
    @happy = true
  end

end
