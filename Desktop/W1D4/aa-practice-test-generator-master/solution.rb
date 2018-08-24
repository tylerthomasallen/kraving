def eight_queens_possibilities(row_num, taken_columns, positions)
  positions ||= []
  return [positions] if row_num == 8

  all_positions = []
  columns_left = (0..7).to_a - taken_columns

  columns_left.each do |col|
    positions_dup = positions.dup
    positions_dup << [row_num, col]

    all_positions += eight_queens_possibilities(row_num + 1,
      taken_columns + [col], positions_dup)
  end

  all_positions
end

def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []

  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

class Array

  def my_reverse
    reversed = []
    my_each{|el| reversed.unshift(el)}
    reversed
  end

end

class Array
  def bubble_sort!
    # Without a proc
    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if self[i] > self[j]
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort!(&prc)
    # With a proc
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

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

