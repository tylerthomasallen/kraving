class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def count
    count = 0
    @grid.each { |arr| count += arr.count(:s)}
    count
  end

  def empty?(pos = [0, 0]) #pos = [1,1]
    self[pos].nil?
  end

  def [](pos)
    row , col = pos
    # p "hey look here"
    grid[row][col]
  end

  def []=(pos, value)
    row , col = pos
    grid[row][col] = value
  end

  def full?
    self.grid.flatten.none? {|pos| pos.nil?}
  end

  def place_random_ship
    raise "error" if self.full?
    random_position = [rand(grid.length), rand(grid[0].length)]
    if self[random_position] == nil
      self[random_position] = :s
    end
  end

  def won?
    self.grid.flatten.none? {|pos| pos == :s}
  end


end
