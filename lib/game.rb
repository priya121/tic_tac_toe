require 'display'
require 'player'
require 'board'
require 'computer_player'

class Game
  attr_reader :cells

  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @board = Board.new(@cells)
    @display = Display.new(@cells,@output)
    @players = Players.new(@cells,@input,@output)
    @computer_player = ComputerPlayer.new(@cells,@input,@output)
  end

  def game_loop
    @output.puts "Choose a position on the board (1 - 9):"
    @display.display_board(@cells)
    player_two_turn
    computer_player
    if @board.x_winning_positions(@cells).size > 0 
    @output.puts "Winner #{@board.x_winning_positions(@cells)}"
    elsif
    @board.o_winning_positions(@cells).size > 0
    @output.puts "Winner #{@board.o_winning_positions(@cells)}"
    end
    @output.puts "End of game."
  end

  private

  def player_two_turn
    while @board.board_not_full? && @board.any_x_winners?(@cells) == false && @board.any_o_winners?(@cells) == false
      new_board = @players.player_two_move
      @display.display_board(new_board)
      computer_player
      @output.puts "Choose a position on the board (1 - 9):"
    end
  end

  def computer_player
    if  @board.board_not_full? && @board.any_x_winners?(@cells) == false && @board.any_o_winners?(@cells) == false
      new_board = @computer_player.best_move(@cells)
      @display.display_board(new_board)
      @output.puts "Next player"
    end
  end
end
