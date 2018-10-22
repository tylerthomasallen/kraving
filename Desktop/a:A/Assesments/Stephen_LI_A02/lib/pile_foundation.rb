require_relative "pile"
require 'byebug'

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    return false if empty?
    return true if count == 13
    false
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    # byebug
    if empty?
      return true if card.value == :ace && card.suit == @suit
    else

      return true if !self.top_card.nil? && (@cards.last.rank + 1 == (card.rank)) && @suit == card.suit
      # return false
    end
    false
    # if !empty?
    # else
    #   return false
    # end
  end
end
