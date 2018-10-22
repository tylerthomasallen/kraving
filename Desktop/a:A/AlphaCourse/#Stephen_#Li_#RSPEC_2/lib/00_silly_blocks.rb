

def reverser(&prc)
  arr = prc.call
  ans = arr.split(" ")
  ans.map {|word| word.reverse}.join(" ")
end

def adder(start = 1, &prc)
  prc.call + start
end

def repeater(n = 1, &prc)
  n.times do
    prc.call
  end
end
