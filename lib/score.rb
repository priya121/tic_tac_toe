require 'board'

class Score
  def initialize(cells)
    @cells = cells
    @board = Board.new(@cells)
  end

  def x_max_score_assessment
    scores = []
    scores << x_score_win
    scores << x_score_loss
    scores << x_score_draw
    max(scores)
  end

  def x_min_score_assessment
    scores = []
    scores << x_score_win
    scores << x_score_loss
    scores << x_score_draw
    min(scores)
  end

  def min(scores)
    scores.min
  end

  def max(scores)
    scores.max
  end

  def x_score_win
    score = 0
    if @board.any_x_winners?(@cells) == true 
      score = +1
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
