require 'board'
require 'game'

class Display
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @game = Game.new(@cells,@input,@output)
    @board = Board.new(@cells,@input,@output)
    @move_count = 0
  end

  def game_loop
    @output.puts "Choose a position on the board (1 - 9):"
    while @board.game_over? == false
      display_board(@cells)
      new_board = @game.human_player_move
      @move_count += 1
      new_game_board = @game.computer_player
      @move_count += 1
    end
      display_board(@cells)
      @output.puts "End of game."
  end

  def move_count
     @move_count   
  end

  def display_board(cells)
    @output.print "\n"
    cells.each_with_index do |cell,index|
      @output.print "'#{cell}'\t"
      if index == 2 || index == 5
        @output.print "\n"
        @output.print "\n"
      end
    end
    @output.print "\n"
  end
end
