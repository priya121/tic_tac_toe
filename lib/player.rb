require 'board'
require 'score'
require 'game'

class Players
  attr_reader :move
  
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @board = Board.new(@cells)
    @score = Score.new(@cells)
  end

  def player_two_move
    index = @input.gets.to_i - 1
    if @board.check_empty?(index) 
      @cells[index] = "x"
    else 
      @output.puts "position occupied, try again"
      player_two_move
    end
    @cells
  end

end
