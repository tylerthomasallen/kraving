# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
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
    hash.to_a.max { |a, b| a.last <=> b.last }.first
  end


  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise 'cannot play card outside your hand' unless @cards.include?(card)
    if card.value == :eight
      pile.play_eight(card, favorite_suit)
    else
      pile.play(card)
    end
      @cards.delete(card)
    # self.favorite_suit
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards += deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    # p @cards
    # @cards.each do |card|
    #   if card.value == :eight && card.valid_play?(card)
    #     return card
    #   end
    # end
    #
    # @cards.each do |card|
    #   if card.value == :eight
    #     return card
    #   end
    # end
    valid_cards = @cards.select { |card| pile.valid_play?(card)}
    return nil if valid_cards.empty?
    return valid_cards.sample if valid_cards.all? { |card| card.value == :eight }
    valid_cards.reject { |card| card.value == :eight}.sample
  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  #HAD TROUBLE HEREEEE
  def play_turn(pile, deck)
    until !!choose_card(pile) || deck.empty?
      draw_from(deck)
    end
    chosen = choose_card(pile)
    return nil if deck.empty? && chosen.nil?
    play_card(pile, chosen)
  end
end
