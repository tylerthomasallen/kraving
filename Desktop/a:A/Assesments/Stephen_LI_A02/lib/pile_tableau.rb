require_relative "pile"

class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    if empty?
      return true
    end

    if !empty?
      return false if @cards.last.color == card.color
      return true if @cards.last.rank - 1 == card.rank
    else
      return false
    end

  end
end
