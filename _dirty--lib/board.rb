# --------------------------------------------- 
# INFORMATIONAL LINK 
# https://s3-us-west-1.amazonaws.com/aa-online/bracket-methods.pdf  
# --------------------------------------------- 

class Board 
  attr_reader :grid; 

  def initialize(grid=Array.new(3) { Array.new(3) }) 
    @grid = grid; 
  end 

  # This method, and the one directly below, allow me to read from and write to 
  # the grid positions using "self[pos]" or "self[pos] = ?" 
  def [](pos) 
    row, col = pos; 
    @grid[row][col]; 
  end 

  def []=(pos, mark) 
    row, col = pos; 
    @grid[row][col] = mark; 
  end 

  def place_mark(pos, mark) 
    # This uses the fancy brackets method/idea from the PDF 
    self[pos] = mark; 

    # Using standard grid assignment 
    # row = pos[0]; 
    # col = pos[1]; 
    # @grid[row][col] = mark; 
  end 

  def empty?(pos) 
    self[pos] == nil ? true : false; 
  end 

  def winner() 
    # there are 8 possible combinations to win the game 
    # all on row 1      => [0,0], [0,1], [0,2] 
    # all on row 2      => [1,0], [1,1], [1,2] 
    # all on row 3      => [2,0], [2,1], [2,2] 
    # all on col 1      => [0,0], [1,0], [2,0] 
    # all on col 2      => [0,1], [1,1], [2,1] 
    # all on col 3      => [0,2], [1,2], [2,2] 
    # all on diag top-L => [0,0], [1,1], [2,2] => aka diag1 
    # all on diag top-R => [0,2], [1,1], [2,0] => aka diag2 
    row1  = @grid[0]; 
    row2  = @grid[1]; 
    row3  = @grid[2]; 

    # Why doesn't self[x,x] work here? 
    # Also, how can I reduce the repetition? 
    col1  = [@grid[0][0], @grid[1][0], @grid[2][0]]; 
    col2  = [@grid[0][1], @grid[1][1], @grid[2][1]]; 
    col3  = [@grid[0][2], @grid[1][2], @grid[2][2]]; 
    diag1 = [@grid[0][0], @grid[1][1], @grid[2][2]]; 
    diag2 = [@grid[0][2], @grid[1][1], @grid[2][0]]; 

    lines = [row1, row2, row3, col1, col2, col3, diag1, diag2]; 

    return :X if lines.any?() do |line| 
      line.all?() { |mark| mark == :X }; 
    end 

    return :O if lines.any?() do |line| 
      line.all?() { |mark| mark == :O }; 
    end 

    return nil; 
  end 

  def over?() 
    return true if self.winner() != nil; 
    return false if @grid.any?() { |row| row.include?(nil) }; 
    return true if @grid.all?() { |row| !row.include?(nil) }; 
  end 
end 
