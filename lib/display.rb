require 'board'
require 'game'

class Display
  def initialize(cells,input,output)
    @input = input
    @output = output
    @cells = cells
    @game = Game.new(@cells,@input,@output)
    @board = Board.new(@input,@output,@cells)
    @player = Player.new(@input,@output,@cells)
    @computer_player = ComputerPlayer.new(@cells,@input,@output)
  end

  def game_loop
    while @board.game_over? == false || @board.board_not_full? == true
    @output.print "Choose a position on the board (1 - 9):"
      string_board = display_converter(@board.cells) 
      display_board(string_board)
      string_new_board = display_converter(@player.player_make_move)
      board_after_computer_move = @computer_player.best_move(string_new_board, :o)
    end
      @output.puts "End of game."
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

  def display_converter(cells)
    cells.map do |cell|
    if cell == :o 
      cell = 'o'
    else
      cell = 'x'
    end
    end
    cells
  end

end
