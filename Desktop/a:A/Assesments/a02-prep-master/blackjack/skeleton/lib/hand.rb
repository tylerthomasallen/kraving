class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    point = 0
    ace = 0
    @cards.each do |card|
      if card.value == :ace
        point += 11
        ace += 1
      else
        point += card.blackjack_value
      end
    end
      if point > 21 && ace > 0
        point -= 10
        ace -= 1
      end
    point
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if busted?

    return false if self.points == other_hand.points
    return true if self.points > other_hand.points
    false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
