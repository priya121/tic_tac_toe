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
    @players = Players.new(@cells,@input,@output)
    @computer_player = ComputerPlayer.new(@cells,@input,@output)
  end

  def board_not_full?
    @board.board_not_full? && @board.any_x_winners?(@cells) == false && @board.any_o_winners?(@cells) == false
  end

  def player_two_turn
    @players.player_two_move
  end

  def computer_player
    @computer_player.best_move(@cells)
  end
end
