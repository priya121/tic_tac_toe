require 'board'

class Score
  def initialize(cells)
    @cells = cells
    @board = Board.new(@cells)
  end

  def score 
    score = 0
    if @board.any_winners?(@cells) == true 
      score = +1
    end
    score
  end

end
