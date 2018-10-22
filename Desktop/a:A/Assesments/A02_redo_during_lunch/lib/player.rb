class Player
  attr_reader :name, :bankroll
  attr_accessor :hand
 #no acces to deck, but access to cards with accessor :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    # @hand
  end

  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards(deck)
    @hand.return_cards(deck)
    @hand = nil

    #all possible with attr_accessor
    # hand.return(card) works.
    # hand = nil wouldn't work. need @
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > @bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt
  end
end
