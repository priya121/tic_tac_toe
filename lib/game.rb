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
    @board = Board.new(@cells,@input,@output)
    @player = Player.new(@cells,@input,@output)
    @computer_player = ComputerPlayer.new(@cells,@input,@output)
  end

  def human_player_move
    @player.player_move
  end

  def computer_player
    @computer_player.best_move(@cells,'o')
  end

  def current_player(move_count)
    if move_count % 2 == 0
      current_player = :x   
    else
      current_player = :o
    end
  end
end
