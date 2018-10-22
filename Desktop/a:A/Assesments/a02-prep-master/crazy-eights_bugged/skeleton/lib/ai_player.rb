# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayr.new(deck.take(8))
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    hash = Hash.new(0)
    @cards.each do |card|
      hash[card.suit] += 1
    end

    hash.value.max
  end


  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise 'cannot play card outside your hand' unless @cards.include?(card)
    if card.value == :eight
      pile.play_eight(card, favorite_suit)
    end
    @cards.delete(card)

    # self.favorite_suit
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards << deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    # p @cards
    @cards.each do |card|
      if card.value == :eight && card.valid_play?(card)
        return card
      end
    end

    @cards.each do |card|
      if card.value == :eight
        return card
      end
    end


  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  #HAD TROUBLE HEREEEE
  def play_turn(pile, deck)
    

  end
end
