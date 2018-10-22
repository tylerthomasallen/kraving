require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.suits.each do |suits|
      Card.value.each do |value|
         deck << Cards.new(suit, value)
       end

     end
     deck
  end

  def initialize(cards = Deck.all_cards)
    @deck = card
  end

  # Returns the number of cards in the deck.
  def count
    @deck.length
  end

  def empty?
    return true if count === 0
    false
  end

  # Takes `n` cards from the top of the deck (front of the cards array).
  def take(n)
    raise 'not enough cards' if n > count
    @deck.shift(n)
  end

  # Returns an array of cards to the bottom of the deck (back of the cards array).
  def return(new_cards)
    @deck << new_cards

  end
end
