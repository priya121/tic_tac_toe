require 'board'

class Player
  def initialize(input,output,cells)
    @input = input
    @output = output
    @cells = cells
    @board = Board.new(@input,@output,@cells)
  end

  def player_make_move
    index = @input.gets.to_i - 1
    if @board.check_empty?(index) 
      @board.make_move(index, :x) 
    else 
      @output.puts "position occupied, try again"
      player_make_move
    end
  end
end
