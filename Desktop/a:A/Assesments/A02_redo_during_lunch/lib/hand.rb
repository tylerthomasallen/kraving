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
    aces = 0
    @cards.each do |card|
      if card.value == :ace
        point += 1
        aces += 1
      else
        point += card.blackjack_value
      end
    end
    aces.times {|ace| point += 10 if point <= 11 }

    point
  end

  def busted?
    return true if points > 21
    false

  end

  def hit(deck)
    #copy and past exceptions
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    #ask about self vs @cards
    #self is an Hand object
    #@cards is an array
    if self.points > other_hand.points && !busted?
      true
    elsif other_hand.busted?
      true
    else
      false
    end
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    #ask about to_s
    @cards.join(",") + " (#{points})"
  end
end
