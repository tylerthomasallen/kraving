ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}
TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
}

EXPONENTIAL = {
  100 => "hundred",
  1000 => "thousand",
  1_000_000 => "million",
  1_000_000_000 => "billion",
  1_000_000_000_000 => "trillion",
}

class Fixnum

  def in_words
    if self < 10
      ONES[self]
    elsif self < 20
      TEENS[self]
    elsif self < 100 && self % 10 == 0
      TENS[self]
    elsif self < 100
      ones = self % 10
      tens = self - (self % 10)
      TENS[tens] + ' ' + ONES[ones]
    elsif self < 1_000
      read_hundred
    elsif self < 1_000_000
      read_thousand
    elsif self < 1_000_000_000
      read_million
    elsif self < 1_000_000_000_000
      read_billion
    elsif self < 1_000_000_000_000_000
      read_trillion
    end

  end

  def read_hundred
    first_set = self / 100
    rest = self % 100
    if rest != 0
      ONES[first_set] + ' ' + EXPONENTIAL[100] + ' ' + rest.in_words
    else
      ONES[first_set] + ' ' + EXPONENTIAL[100]
    end
  end

  def read_thousand
    first_set = self / 1000
    rest = self % 1000
    if rest != 0
      first_set.in_words + ' ' + EXPONENTIAL[1000] + ' ' + rest.in_words
    else
      first_set.in_words + ' ' + EXPONENTIAL[1000]
    end
  end

  def read_million
    first_set = self / 1_000_000
    rest = self % 1_000_000
      if rest != 0
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000] + ' ' + rest.in_words
      else
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000]
      end
  end

  def read_billion
    first_set = self / 1_000_000_000
    rest = self % 1_000_000_000
      if rest != 0
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000_000] + ' ' + rest.in_words
      else
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000_000]
      end
  end

  def read_trillion
    first_set = self / 1_000_000_000_000
    rest = self % 1_000_000_000_000

      if rest != 0
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000_000_000] + ' ' + rest.in_words
      else
        first_set.in_words + ' ' + EXPONENTIAL[1_000_000_000_000]
      end
  end
end

p 123_456_789.in_words

#


# elsif self < 1000
#   hundreds = self / 100 #self = 200
#   ONES[hundreds] + " " + EXPONENTIAL[self]
