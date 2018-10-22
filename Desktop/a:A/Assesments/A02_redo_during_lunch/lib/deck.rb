require_relative 'card'


# Represents a deck of playing cards.
class Deck
  # attr_accessor :cards
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.values.each do |value|
      Card.suits.each do |suit|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > count
    @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end

end
