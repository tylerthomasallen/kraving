class Temperature
  attr_accessor :fahrenheit, :celsius


  def initialize(options)
    @fahrenheit = options[:f]
    @celsius = options[:c]
  end


  def in_fahrenheit
    if self.fahrenheit
      return fahrenheit
    else
      return (self.celsius * 9 / 5.0) + 32
    end
  end

  def in_celsius
    if self.fahrenheit
      return (fahrenheit - 32) * 5 / 9
    else
      return self.celsius
    end
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end

  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

end



class Celsius
  def initialize(temp)
    @celsius = temp

  end
end

# Subclasses/Inheritance
#
# class Celsius < Temperature
#   def initialize(temp)
#     self.in_celsius = temp
#   end
# end



































#   def initialize(options)
#     if options[:f]
#       self.fahrenheit = options[:f]
#     else
#       self.celsius = options[:c]
#     end
#   end
#
#   def fahrenheit=(temp)
#     @temperature = self.class.ftoc(temp)
#   end
#
#   def celsius=(temp)
#     @temperature = temp
#   end
#
#   def in_fahrenheit
#     self.class.ctof(@temperature)
#   end
#
#   def in_celsius
#     @temperature
#   end
#
#
#   def self.ctof(temp)
#     p temp
#     p (temp * 9 / 5.0) + 32
#   end
#
#   def self.ftoc(temp)
#     p temp
#     p (temp - 32) * (5.0 / 9)
#   end
#
#   def self.from_fahrenheit(temp)
#     self.new(f: temp)
#   end
#
#   def self.from_celsius(temp)
#     self.new(c: temp)
#   end
# end
#
# # Subclasses/Inheritance
# class Celsius < Temperature
#   def initialize(temp)
#     self.celsius = temp
#   end
# end
#
# class Fahrenheit < Temperature
#   def initialize(temp)
#     self.fahrenheit = temp
#   end
# end
