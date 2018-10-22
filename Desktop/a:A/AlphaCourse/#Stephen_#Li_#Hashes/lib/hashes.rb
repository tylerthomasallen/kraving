# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  ans = {}
  word = str.split
  word.each {|w| ans[w] = w.length}
  ans
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by { |k , v| v }[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k ,v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  ans = Hash.new(0)
  word.each_char do |el|
    ans[el] += 1
  end
  ans
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  keys = {}
  arr.each {|el| keys[el] = "exist"}
  keys.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  ans = { :even => 0, :odd => 0}
  numbers.each do |el|
    if el.even?
      ans[:even] += 1
    else
      ans[:odd] += 1
    end
  end
  ans
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  arr = string.chars
  ans = Hash.new(0)
  arr.each do |el|
    ans[el] += 1
  end
  ans.sort_by { |k , v| v}[-1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  students.select! { |k , v| v > 6}
  keys = students.keys
  ans = []
  i = 0
  while i < keys.length - 1
    j = i + 1
      while j < keys.length
        ans << [keys[i],keys[j]]
        j += 1
      end
    i += 1
    end
  ans
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  uniq = specimens.uniq
  count = Hash.new(0)

  uniq.each do |animal|
    count[animal] = specimens.count(animal)
  end

  number_of_species = uniq.length
  smallest_population_size = count.values.min
  largest_population_size = count.values.max

  number_of_species ** 2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
    normal = character_count(normal_sign)
    vandalized = character_count(vandalized_sign)

    vandalized.all? do | char , count |
      normal[char.downcase] >= count
    end
end

def character_count(str)
  count = Hash.new(0)

  str.each_char do |char|
    next if char == " "
    count[char.downcase] += 1
  end
  count
end
