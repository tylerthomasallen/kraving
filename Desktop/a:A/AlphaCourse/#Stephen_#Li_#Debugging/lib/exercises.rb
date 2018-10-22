# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.
require 'byebug'
LITTLE_WORDS = [
  "and",
  "the",
  "over"
]

def titleize(title)
  # debugger
  words = title.split(" ") #words = array
  titleized_words = words.map.each_with_index do |word, idx|
    unless (idx != 0 && LITTLE_WORDS.include?(word))
      word.capitalize
    else
      word.downcase
    end
  end

  titleized_words.join(" ")
end


# Write a method that returns the largest prime factor of a given integer.

def prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
  num.downto(2) do |factors|
    if (num % factors).zero? && prime?(factors)
      return factors
    end
  end
  if num == 0 || num == 1
    nil
  end
end


# Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

def symmetric_substrings(str)
  ans = []
  i = 0
  while i < str.length - 1
    j = i + 1
    while j < str.length
      if str[i..j] == str[i..j].reverse
        p str[i..j]
        ans << str[i..j]
      end
    j += 1
    end
  i += 1
  end
  ans.sort
end


# Write a method that returns `true` if all characters in the string
# are unique and `false` if they are not.

def all_unique_chars?(str)
  letters = str.split('').reject{ |char| char == '  '}
  letters.uniq.length = letters.length

end
