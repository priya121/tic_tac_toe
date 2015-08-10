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
    if @board.any_x_winners?(game_state) == true 
      score = + 10
    elsif @board.any_o_winners?(game_state) == true
      score = - 10
    else 
      score = 0
    end
    score
  end

  def x_score_loss
    score = 0
    if @board.any_o_winners?(@cells) == true 
      score = - 1
    end
    score
  end

  def x_score_draw
    score = 0
    if @board.any_o_winners?(@cells) == false && @board.any_x_winners?(@cells) == false
      score = 0
    end
    score
  end
end
