def range(start, finish)
  return [] if start >= finish
  ([start] + range(start + 1, finish))
end

def sum_of_array(arr)
  return arr.first if arr.length == 1
  arr.first + sum_of_array(arr[1..-1])
end

def sum_of_array_iterative(arr)
  arr.reduce(:+)
end

def exp_one(n, exp)
  return 0 if n == 0
  return 1 if exp <= 0
  n * exp_one(n, exp - 1)
end 

def exp_two(n, exp)
  return 0 if n == 0
  return 1 if exp <= 0
  if exp.even?
    exp_two(n, exp / 2 ) ** 2
  else
    n * (exp_two(n, (exp - 1)/ 2) ** 2)
  end
end

class Array 
  def deep_dup
    self.each do |el| 
      if el.is_a? Array 
        el.deep_dup
      else 
        [] << el
      end 
    end 
  end 
end 

def fibinacci_iterate(num)
  return [0] if num == 1
  arr = [0, 1]
  return arr if num == 2
    i = 0
  while arr.length < num
    arr << arr[i] + arr[i + 1]  
    i += 1  
  end
  arr
end
  

def fibonacci_recursion(num) 
  return [0, 1] if num == 2
  arr = fibonacci_recursion(num - 1) 
  sum = arr[-1] + arr[-2]
  arr << sum
end 

def binary(arr,target)
  return nil if arr.include?(target)
  # mid = binary(arr,target)
  mid = arr.length / 2
  if target < arr[mid]
      binary(arr[0...mid], target)
  else target > arr[mid]
      binary(arr[(mid + 1)..-1], target)
  end 
end

def binary(arr,target)
  p arr
  mid = arr.length / 2
  return nil if arr.empty?
  return mid if target == arr[mid] 
  if target < arr[mid] 
    binary(arr[0...mid], target)
  elsif target > arr[mid]
    binary_secondary = binary(arr[(mid + 1)..-1], target)
    if binary_secondary == nil
      return nil
    end  
    binary_secondary + mid + 1
  end 
end







