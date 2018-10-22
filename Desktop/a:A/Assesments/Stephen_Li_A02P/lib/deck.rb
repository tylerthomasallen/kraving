require_relative 'card'


# Represents a deck of playing cards.
class Deck
  # attr_accessor :cards
  # Returns an array of all 52 playing cards.
  def self.all_cards
    ans = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        ans << Card.new(suit, value)
      end
    end
    ans

  end


  def initialize(cards = Deck.all_cards)
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if count < n
    @deck.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @deck += cards
  end

end
