require 'board'

class Score
  def initialize(cells)
    @cells = cells
    @board = Board.new(@cells)
  end


  def min(scores)
    scores.min
  end

  def max(scores)
    scores.max
  end

  def x_score(game_state)
    if @board.any_x_winners?(game_state) 
      score = + 10
    elsif @board.any_o_winners?(game_state) 
      score = - 10
    else 
      score = 0
    end
    score
  end

end
