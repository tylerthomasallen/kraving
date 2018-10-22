require_relative "memory_card.rb"
require_relative "memory_board.rb"

class Game
  attr_accessor :board

  def initialize(pairs = 5)
    @board = Board.new(pairs)
    @board.populate
  end

  def play
    until @board.won?
      @board.render
      current_guess = guess
      if check_guess?(current_guess)
        @board.reveal(current_guess[0], current_guess[1])
        @board.reveal(current_guess[2], current_guess[3])
      else
        puts "Guess again!"
      end

    end
    puts "about time!"
  end

  def guess
    puts "GUESS ROW OF FIRST CARD ex. 0"
    first_card_row = gets.chomp.to_i
    puts "GUESS COL OF FIRST CARD ex. 1"
    first_card_col = gets.chomp.to_i
    puts "GUESS ROW OF SECOND CARD ex. 0"
    second_card_row = gets.chomp.to_i
    puts "GUESS COL OF SECOND CARD ex. 1"
    second_card_col = gets.chomp.to_i
    [first_card_row, first_card_col, second_card_row, second_card_col]
  end

  def check_guess?(guess) #[0,0,0,1]
    [guess[0],guess[1]] != [guess[2],guess[3]] &&
    @board.grid[guess[0]][guess[1]].value == board.grid[guess[2]][guess[3]].value

  end

end

p $PROGRAM_NAME
p __FILE__
if $PROGRAM_NAME == __FILE__
  new = Game.new
  new.play
  # new.board.populate
  # board.render
end
