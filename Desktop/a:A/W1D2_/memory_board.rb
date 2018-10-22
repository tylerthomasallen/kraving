class Board
  attr_accessor :grid, :pairs
  def initialize(pairs)
    @pairs = pairs
    @grid = Array.new(2) {Array.new(pairs)}
  end

  def populate
    full_deck = []
    (@pairs*2).times {full_deck << Card.new}
    (0...@pairs).each do |idx|
      full_deck[idx].value = full_deck[@pairs+idx].value
    end
    full_deck.flatten!
    full_deck.shuffle!
    # full_deck.flatten.shuffle! #doesn't work for some reason??
    @grid.map! do |row|
      row.map! {|col| col = full_deck.pop}
    end
  end

  def render
    result = @grid.map do |row|
      row.map do |card|
        card.display
      end.join(" ")
    end.join("\n")
    puts result
  end

  def won?
    @grid.flatten.all? {|card| card.face_up }
  end

  def reveal(row, col)
    card = @grid[row][col]
    card.reveal
  end

  # def []=(location) #[0,0]
  #     @grid[location[0]] = location[0]
  #     @grid[location[1]] = location[1]
  # end
  #
  # def [](location) #[0,0]
  #     [@grid[location[0]],
  #     @grid[location[1]]]
  # end
end
