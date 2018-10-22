class Board
  attr_reader :grid, :marks

  def self.blank_grid
    Array.new(3){Array.new(3)}
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X , :O]
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def empty?(pos)
    self[pos].nil?
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def winner
    (grid + cols + diagonal ).each do |triple|
      return :X if triple == [:X , :X , :X]
      return :O if triple == [:O , :O , :O]
    end
    nil
  end

  def diagonal
    down_diag = [[0 ,0] , [1 ,1], [2 ,2]]
    up_diag = [[2 ,0], [1 , 1], [0, 2]]

    [down_diag, up_diag].map do |diag|
      diag.map { |row, col| grid[row][col] }
    end
  end

  def cols
    cols = [[],[],[]]
    grid.each do |row|
      row.each_with_index do |mark , idx|
        cols[idx] << mark
      end
    end
    cols
  end

  def over?
    grid.flatten.none? { |marks| marks.nil?} || winner
  end



end









# class Board
#   attr_reader :grid, :marks
#
#   def self.blank_grid
#     Array.new(3){ Array.new(3) }
#   end
#
#   def initialize(grid = Board.blank_grid)
#     @grid = grid
#     @marks = [:X , :O]
#   end
#
#   def [](pos)
#     row, col = pos
#     grid[row][col]
#   end
#
  # def []=(pos,value)
  #   row, col = pos
  #   grid[row][col] = value
  # end
#
#   def place_mark(pos, mark)
#     self[pos] = mark
#   end
#
#   def empty?(pos)
#     self[pos].nil?
#   end
#
#   def winner
#     (grid + diagonals + cols ).each do |triple|
#       return :X if triple == [:X, :X, :X]
#       return :O if triple == [:O, :O, :O]
#     end
#     nil
#   end
#
#   def diagonals
#     down_diag = [[0, 0],[1, 1],[2 , 2]]
#     up_diag = [[0, 2], [1,1], [2, 0]]
#     [down_diag, up_diag].map do |diag|
#       diag.map { |row, col| grid[row][col]}
#     end
#   end
#
#   def cols
#     cols = [[ ],[ ],[ ]]
#     grid.each do |row|
#       row.each_with_index do |mark, col_idx|
#         cols[col_idx] << mark
#       end
#     end
#     cols
#   end
#
#   def over?
#     grid.flatten.none? {|pos| pos.nil?} || winner
#   end
#
# end
