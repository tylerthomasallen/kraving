require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0,:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? {|string| string.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  ans = []
  arr = string.chars.reject {|l| l == " "}
  i = 0
  while i < arr.length
    j = i + 1
      while j < arr.length
        if arr[i] == arr[j]
          ans << arr[i]
        end
        j += 1
      end
    i += 1
  end
  ans.uniq.sort
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.delete(",.?!:''")
  string.split.sort_by {|word| word.length}[-2..-1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alpha = ("a".."z")
  alpha.reject do |el|
    string.downcase.include?(el)
  end
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select do |year|
    not_repeat_year?(year)
  end
end

def not_repeat_year?(year)
  year.to_s.chars == year.to_s.chars.uniq
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  uniq_song = songs.uniq
  uniq_song.select do |song|
    no_repeats?(song,songs)
  end
end

def no_repeats?(song_name, songs)
  songs.each_with_index do |song , idx|
    if song == song_name
      return false if song == songs[idx + 1]
    end
  end
  true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  remove_punctuation(string)
  c_word = string.split(" ").select {|word| word.include?("c")}
  return " " if c_word.empty?
  c_word.sort_by {|word| c_distance(word)}[0]
end

def c_distance(word)
  word.reverse.index("c")
end

def remove_punctuation(string)
  string.delete!(",?!.")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
# nums = [1, 2, 3, 3, 4, 4, 4, 3, 3]
# ranges = [[2, 3], [4, 6], [7, 8]]
def repeated_number_ranges(arr)
  ranges = []
  start_idx = nil

  arr.each_with_index do |el , idx|
    next_el = arr[idx + 1]
    if el == next_el
      start_idx = idx unless start_idx
    elsif start_idx
      ranges << [ start_idx , idx ]
      start_idx = nil
    end
  end
  ranges
end
