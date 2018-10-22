def echo(str)
  str
end


def shout(str)
  str.upcase
end


def repeat(str , num=2 )
  ans = (str + " ") * num
  p ans[0..-2]
end

def start_of_word(str,num)
  str[0...num]
end
# p start_of_word("hello", 1)
# p start_of_word("Bob", 2)
# s = "abcdefg"
# p start_of_word(s, 1)
# p start_of_word(s, 2)
# p start_of_word(s, 3)

def first_word(str)
  str.split(" ")[0]
end

def titleize(str)
little_word = ["the","and","over"]
ans = []
arr_word = str.split(" ")
  arr_word.each do |word|
    if little_word.include?(word)
      ans << word
    else
      ans << word[0].upcase + word[1..-1]
    end
  end
  ans[0][0] = ans[0][0].upcase
  ans.join(" ")
end
