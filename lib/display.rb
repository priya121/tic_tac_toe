require 'board'
require 'game'

class Display
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @game = Game.new(@cells,@input,@output)
  end

  def game_loop
    @output.puts "Choose a position on the board (1 - 9):"
    while @game.board_not_full?
      display_board(@cells)
      new_board = @game.player_two_turn
      display_board(new_board)
      new_board = @game.player_two_turn
      new_game_board = @game.computer_player
      display_board(new_game_board)
      @output.puts "End of game."
    end
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
