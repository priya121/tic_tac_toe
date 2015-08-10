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
    @output.puts "Winner #{@board.x_winning_positions(@cells)}"
    @output.puts "Winner #{@board.o_winning_positions(@cells)}"
    @output.puts "End of game."
  end

  def player_one_turn
    while @board.board_not_full? == true && @board.any_x_winners?(@cells) != true && @board.any_o_winners?(@cells) != true
      updated_board = @players.player_one_move
      @display.display_board(updated_board)
      @output.puts "Next player"
      player_two_turn
    end
  end

  def player_two_turn
    while @board.board_not_full? == true && @board.any_x_winners?(@cells) != true && @board.any_o_winners?(@cells) != true
      new_board = @players.player_two_move
      @display.display_board(new_board)
      @output.puts "Next player"
      computer_player
    end
  end

  def computer_player
    if  @board.board_not_full? == true && @board.any_x_winners?(@cells) != true && @board.any_o_winners?(@cells) != true
      new_board = @computer_player.best_move(@cells)
      @display.display_board(new_board)
      @output.puts "Next player"
    end
  end
end


