require 'board'
class Score
  def initialize(cells,input,output)
    @cells = cells
    @input = input
    @output = output
    @board = Board.new(@cells,@input,@output)
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
