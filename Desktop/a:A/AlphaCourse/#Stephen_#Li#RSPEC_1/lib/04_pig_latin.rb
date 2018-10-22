def translate(str)
vowels = "aeio"
q = "q"
ans = []
arr = str.split(" ")
  arr.each do |word|
    until vowels.include?(word[0].downcase)
      word = word[1..-1] + word[0]
        if q.include?(word[0].downcase)
          word = word[2..-1] + word[0..1]
        end
    end
    ans << word + "ay"
  end
  ans.join(" ")
end
