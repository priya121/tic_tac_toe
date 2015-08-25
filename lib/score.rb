require 'board'
class Score
  def initialize(input,output,cells)
    @input = input
    @output = output
    @cells = cells
    @board = Board.new(@input,@output,@cells)
  end

  def score
    score = 0
    if @board.any_won? == true
      score = + 10
    elsif @board.draw? == true
      score = 0
    end
  end
end
