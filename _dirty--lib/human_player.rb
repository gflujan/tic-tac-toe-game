class HumanPlayer 
  attr_accessor :mark; 
  attr_reader :name, :board; 

  def initialize(name) 
    @name = name; 
  end 

  def display(board) 
    @board = board; 

    # Add actual board formatting/rendering here 
    puts "---------------"; 
    puts "---------------"; 
    print " #{@board.grid[0][0]} | #{@board.grid[0][1]} | #{@board.grid[0][2]} "; 
    puts "\n---------------"; 
    print " #{@board.grid[1][0]} | #{@board.grid[1][1]} | #{@board.grid[1][2]} "; 
    puts "\n---------------"; 
    print " #{@board.grid[2][0]} | #{@board.grid[2][1]} | #{@board.grid[2][2]} "; 
    puts "\n---------------"; 
    puts "---------------"; 
  end 

  def get_move() 
    puts 
    puts "#{@name}, where would you like to place your mark? (#{@mark})"; 
    puts "Pick a position (row, col)"; 
    input = gets.chomp(); 
    position = input.delete(' ').split(','); 
    position.map!(&:to_i) # { |ele| ele.to_i() }; 
  end 
end 
