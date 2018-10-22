require_relative "card"

class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    #needed to adda  move_history variable
    @move_history = []
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    deal_tableau
    # ...
  end

  #needed to understand how to create a deck class and push in right about of cards
  def deal_tableau
    deck = Card.all_cards
      until deck.empty?
        @tableau.each do |slot|
          slot << deck.pop
          break if deck.empty?
        end
      end

  end

  def move!(from_pile, to_pile)

    to_pile << from_pile.draw

  end

  def move(from_pile, to_pile)
    raise "error" unless valid_move?(from_pile, to_pile)
    move!(from_pile, to_pile)
    #need move_history variable, and would add array of past piles
    @move_history << [from_pile, to_pile]
  end

  def undo_move
    raise "error" if @move_history.empty?

    last_move = @move_history.pop
    move!(last_move[1], last_move[0])
    #reverse the inputs


  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    to_pile.valid_move?(from_pile.top_card)

  end

  def won?
    return false if @foundations.any? {|pile| pile.empty?}
    return false unless @foundations.all? {|pile| pile.complete?}
    true
    #use methods from foundation_pile class
  end

  # def move_history
  #   Array
  # end
end
