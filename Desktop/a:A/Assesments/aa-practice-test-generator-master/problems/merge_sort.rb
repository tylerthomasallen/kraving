class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x<=> y}

    return self if count <= 1

    mid = count / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merge = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right

  end
end
