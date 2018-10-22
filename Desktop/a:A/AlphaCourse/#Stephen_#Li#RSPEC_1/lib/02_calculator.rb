def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1-num2
end

def sum(arr)
  if arr == []
    0
  else
  arr.reduce(:+)
  end
end


def multiply(num1, num2)
  num1 * num2
end

def multiplies(arr)
  arr.reduce(:*)
end
