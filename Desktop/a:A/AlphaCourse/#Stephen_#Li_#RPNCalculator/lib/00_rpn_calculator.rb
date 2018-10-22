class RPNCalculator

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def plus
    perform_op(:+)
  end

  def minus
    perform_op(:-)
  end

  def divide
    perform_op(:/)
  end

  def times
    perform_op(:*)
  end

  def value
    @stack.last
  end

  def tokens(string)
    token = string.split(" ")
    token.map {|el| operator?(el) ? el.to_sym : Integer(el)}
  end

  def evaluate(string)
    token = tokens(string)
    token.each do |el|
      case el
      when Integer
        push(el)
      else
        perform_op(el)
      end
    end
    value
  end

  private
  SYMBOLS = [ :+ , :- , :* , :/ ]


  def operator?(el)
    SYMBOLS.include?(el.to_sym)
  end

  def perform_op(symbol)
    p @stack
    raise "calculator is empty" if @stack.count < 2

    first = @stack.pop
    second = @stack.pop

    case symbol
    when :+
      @stack << first + second
    when :-
      @stack << second - first
    when :*
      @stack << first * second
    when :/
      @stack << second.to_f / first.to_f
    else
      @stack << second
      @stack << first
      raise "No such operation: #{symbol}"
    end
  end
end
