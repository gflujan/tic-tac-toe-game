require_relative 'board' 
require_relative 'human_player' 
require_relative 'computer_player' 

class Game 
  attr_reader :board, :current_player; 

  def initialize(player_one, player_two) 
    # ASSIGNMENTS FOR SPEC TESTS 
    # @player_one = player_one; 
    # @player_two = player_two; 

    # ASSIGNMENTS FOR AN ACTUAL/PLAYABLE GAME 
    @player_one = HumanPlayer.new(player_one[:name]); 
    @player_one.mark = player_one[:mark]; 

    @player_two = ComputerPlayer.new(player_two[:name]); 
    @player_two.mark = player_two[:mark]; 

    @board = Board.new(); 
    @current_player = @player_one; 
  end 

  def play_turn() 
    move = @current_player.get_move(); 
    mark = @current_player.mark; 
    @board.place_mark(move, mark); 
    self.switch_players!(); 
    @current_player.display(@board); 
  end 

  def switch_players!() 
    @current_player = @current_player == @player_one ? @player_two : @player_one; 
  end 

  def play() 
    puts 
    puts 'Welcome to the latest, and best, version of Tic-Tac-Toe!'; 
    until @board.over?() 
      self.play_turn(); 
    end 
    puts 'Congrats! The game is over!'; 
  end 
end 

if __FILE__ == $PROGRAM_NAME 
  puts 'Starting a new game of Tic-Tac-Toe...'; 

  puts 
  puts 'Please enter the name for Player 1:'; 
  p1_name = gets.chomp(); 
  p1 = {name: p1_name, mark: :X}; 

  puts 
  puts 'Please enter the name for Player 2:'; 
  p2_name = gets.chomp(); 
  p2 = {name: p2_name, mark: :O}; 

  Game.new(p1, p2).play(); 
end 

# FINAL NOTES:
# The game is playable, but there are a few things that I'd like to do to clean it up 
# —————————————————————————————————————————— 
# 0) Ask how many players there will be 
  # If 1, make Player 2 a new ComputerPlayer instance 
  # else, create both players as instances of HumanPlayer 
# 1) I want to put some more flexibility into the start of the game 
  # I want to ask Player 1 if they would like to be "X's" or "O's" 
  # Player 2 would be whatever Player 1 isn't 
  # I need to put in some logic to check if a mark currently/already exists 
    # Human players are able to overwrite occupied positions 
# 2) I need to clean up the .display() method so that the board is user friendly 
  # right now, it's just the print out of the enumerable (?) 
  # it shows the available positions, but there's a bunch of extra crap that the user doesn't need 
  # I also want to give the positions names instead of just using values 
    # (e.g. "top left", "top middle", "top right", etc.) 
    # If there's manual input from the user, I need to add errors/warnings and re-prompt for their desired position 
    # Otherwise, I can "force" them to only pick certain options 
  # I want to get rid of using symbols as the marks, for display, I want to replace them with strings 
# 3) I want to add some context to show which player (and maybe the mark) is currently up 
  # Also, when it's a human player, I want to give them a note on how to correctly enter the values 
  # When it's a comp player's turn, I want to show some "thinking" output 
# 4) When the game is over, I want to print out a message based on the outcome (winner vs. tied) 
  # Similarly, I want to display the final state of the board, w/e the outcome was 
# 5) I want to ask the player(s) if they want to play again? 
  # If it's the same players, how can I re-cycle the previously entered information? 
  # If there are new players, I need to prompt them for the proper info 
# 6) Finally, how do I create a graphical interface for this and deploy it to Heroku? 
  # (or something similar) 
