class ComputerPlayer 
  attr_accessor :mark; 
  attr_reader :name, :board; 

  def initialize(name) 
    @name = name; 
  end 

  def display(board) 
    @board = board; 
  end 

  def get_move() 
    puts 
    puts "#{@name} The Computer is thinking..."; # => put a randomized time delay before returning the move to simulate "thinking" 
    # I want to look at the "lines" of the board and check if there are two of the comp's marks 
      # as well as one "nil" value 
    # If there are, then I want to return the values of the position that contains "nil" 
    # Similarly, if there is only 1 or none "comp marks" on any "line" 
      # then I want to pick the values of a position, anywhere on the board, that contains "nil" 

    # This is redundant, but I can't get constant or instance variables 
    # from the board to be visible here; there has to be a way 
    row1  = @board.grid[0]; 
    row2  = @board.grid[1]; 
    row3  = @board.grid[2]; 
    col1  = [@board.grid[0][0], @board.grid[1][0], @board.grid[2][0]]; 
    col2  = [@board.grid[0][1], @board.grid[1][1], @board.grid[2][1]]; 
    col3  = [@board.grid[0][2], @board.grid[1][2], @board.grid[2][2]]; 
    diag1 = [@board.grid[0][0], @board.grid[1][1], @board.grid[2][2]]; 
    diag2 = [@board.grid[0][2], @board.grid[1][1], @board.grid[2][0]]; 

    lines = [row1, row2, row3, col1, col2, col3, diag1, diag2]; 

    # Index positions for each line 
    row1_pos  = [[0,0], [0,1], [0,2]]; 
    row2_pos  = [[1,0], [1,1], [1,2]]; 
    row3_pos  = [[2,0], [2,1], [2,2]]; 
    col1_pos  = [[0,0], [1,0], [2,0]]; 
    col2_pos  = [[0,1], [1,1], [2,1]]; 
    col3_pos  = [[0,2], [1,2], [2,2]]; 
    diag1_pos = [[0,0], [1,1], [2,2]]; 
    diag2_pos = [[0,2], [1,1], [2,0]]; 

    pos = nil; 

    lines.each() do |line| 
      num_marks = 0; 
      
      line.each() do |ele| 
        num_marks += 1 if ele == @mark; 
      end 

      if num_marks == 2 and line.include?(nil) 
        case line 
        when row1 
          idx = line.find_index(nil); 
          pos = row1_pos[idx]; 
        when row2 
          idx = line.find_index(nil); 
          pos = row2_pos[idx]; 
        when row3 
          idx = line.find_index(nil); 
          pos = row3_pos[idx]; 
        when col1 
          idx = line.find_index(nil); 
          pos = col1_pos[idx]; 
        when col2 
          idx = line.find_index(nil); 
          pos = col2_pos[idx]; 
        when col3 
          idx = line.find_index(nil); 
          pos = col3_pos[idx]; 
        when diag1 
          idx = line.find_index(nil); 
          pos = diag1_pos[idx]; 
        when diag2 
          idx = line.find_index(nil); 
          pos = diag2_pos[idx]; 
        else 
          pos = nil; 
        end 
      end 
    end 

    if pos == nil 
      return find_rand_nil(); 
    else 
      return pos; 
    end 
  end 

  def find_rand_nil() 
    nil_positions = []; 

    # I need to return an array w/ 2 integers 
    @board.grid.each_index do |i| 
      @board.grid.each_index do |j| 
        if @board.grid[i][j] == nil 
          nil_positions << [i,j]; 
        end 
      end 
    end 

    rand_idx = rand(0...nil_positions.length()); 
    return nil_positions[rand_idx]; 
  end 
end 
