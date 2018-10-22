def ftoc(num)
  ((num - 32) * 5 / 9).to_i
end

def ctof(num)
 ans = num * 9.0 / 5 + 32
  if ans.to_s[-1] == "0"
    ans = ans.to_i
  end
  ans
end
