class Code
  attr_reader :pegs

  PEGS = {
  "r" => "red",
  "b" => "blue",
  "y" => "yellow",
  "o" => "orange",
  "g" => "green",
  "p" => "purple"
  }

  def initialize(pegs)
    @pegs = pegs
  end


  def self.parse(pegs)
    if pegs.downcase.chars.all? {|color| PEGS.keys.include?(color)}
     self.new(pegs.split(""))
    else
      raise "incorrect"
    end

  end

  def self.random
    str = ""
    until str.length == 4
      str << ["r","b","y","o","g","p"].sample
    end
    self.parse(str)
  end

  def [](i)
    @pegs[i]
      # [@pegs[0], @pegs[1], @pegs[2], @pegs[3]]
  end

  def exact_matches(other_code)
    ans = 0
    @pegs.each_with_index do | peg , idx|
      other_code.pegs.each_with_index do |other_peg , other_idx|
        if peg == other_peg && idx == other_idx
          ans += 1
        end
      end
    end
    ans
  end

  def near_matches(other_code)
    other_code_hash = other_code.other_code_count
    first_code_hash = self.other_code_count
    ans = 0

    first_code_hash.each do |color1 , count1|
      next unless other_code_hash.has_key?(color1)
        ans += [count1, other_code_hash[color1]].min
      end
      ans - self.exact_matches(other_code)
    end


  def other_code_count
    ans = Hash.new(0)
    @pegs.each do |color|
      ans[color] += 1
    end
    ans
  end
  #
  def ==(other_code)
    return false unless other_code.class == Code
    @pegs== other_code.pegs
  end

end


class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def get_guess
    Code.parse(gets.chomp)
  end

  def display_matches(code)
    exact = @secret_code.exact_matches(code)
    near = @secret_code.near_matches(code)
    puts "#{exact} exact matches and #{near} near matches!"
  end



end
