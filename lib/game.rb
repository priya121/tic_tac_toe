require 'player'
require 'computer_player'

class Game
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @player = Player.new(@input,@output,@cells)
    @computer_player = ComputerPlayer.new(@cells,@input,@output)
  end

  def human_player_move
    @player.player_make_move
  end

  def computer_player
    @computer_player.best_move(@cells,:o)
  end

  def current_player(move_count)
    if move_count % 2 == 0
      current_player = :x   
    else
      current_player = :o
    end
  end
end
