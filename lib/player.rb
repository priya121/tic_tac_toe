require 'board'
require 'score'
require 'game'

class Player
  attr_reader :move
  
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @board = Board.new(@cells,@input,@output)
    @score = Score.new(@cells,@input,@output)
  end

  def player_move
    index = @input.gets.to_i - 1
    if @board.check_empty?(index) 
      @cells[index] = 'x'
    else 
      @output.puts "position occupied, try again"
      player_move
    end
    @cells
  end

end
