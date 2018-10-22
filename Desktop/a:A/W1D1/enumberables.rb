class Array

  def my_each(&prc)
    i = 0
    until i == length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |num|
      result << num if prc.call(num)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |num|
      result << num if !prc.call(num)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num) == true
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |num|
      return false if prc.call(num) == false
    end
    true
  end

  def my_flatten
    new_arr = self.join.split("")
    new_arr.map { |num| num.to_i }
    # result = []
    #
    # self.each do |element|
    #   if element.class == Array
    #     element.my_flatten
    #     # result << element.my_flatten
    #   else
    #     result << element
    #   end
    # end
    # result
    # copy.my_flatten
  end

  def my_zip(*args)
    result = []

    self.each_with_index do |el, idx|
      index_result = [el]
      args.each do |el2|
        index_result << el2[idx]
      end
      result << index_result

    end
    result

  end

  def my_rotate(n = 1)
    n = n % length
    self.drop(n) + self.take(n)
  end

  def my_join(seperator = "")
    result = ""
    self.each_with_index do |letter, idx|
      result << letter
      result << seperator unless idx == length - 1
    end
    result
  end

  def my_reverse
    result = []
    i = -1

    while i > (-length - 1)
      result << self[i]
      i -= 1
    end
    result
  end

  def bubblesort!(&prc)
    prc ||= Proc.new {|x, y| x <=> y }
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |num, idx|
        next if idx == length - 1
        idx2 = idx + 1

        if prc.call(num , self[idx2]) == 1
          self[idx] , self[idx2] = self[idx2], self[idx]
          sorted = false
        end
      end
    end
    self
  end

  def bubblesort(&prc)
    self.dup.bubblesort!(&prc)
  end

end


def factors(num)
  result = []
  (1..num).each do |n|
    result << n if num % n == 0
  end
  result
end

def substrings(string)
  result = []
  i = 0

  while i < string.length
    j = i
    while j < string.length
      result << string[i..j]
      j += 1
    end
    i += 1
  end
  result
end

def subwords(word, dictionary)
#catepillar
  substring = substrings(word)
  substring.select {|word| dictionary.include?(word)}.uniq
end
