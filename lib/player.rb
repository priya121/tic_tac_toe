require 'board'

class Players
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @board = Board.new(@cells)
  end

  def player_one_move
    index = @input.gets.to_i - 1
    if @board.check_empty?(index) == true
      @cells[index] = "x"
    else 
      @output.puts "position occupied, try again"
      player_one_move
    end
    @cells
  end

  def player_two_move
    index = @input.gets.to_i - 1
    if @board.check_empty?(index) == true
      @cells[index] = "o"
    else 
      @output.puts "position occupied, try again"
      player_two_move
    end
    @cells
  end


end
