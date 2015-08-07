require 'score'

class ComputerPlayer
  def initialize(cells)
    @cells = cells
    @score = Score.new(@cells)
  end

  def computer_player
    @winning_move = []
    @cells.each_with_index do |check_if_win, index|
      if @cells[index]  == ' ' 
        @cells[index] = 'x'
        score = @score.x_score_win
        @cells[index] = ' '
        if score == 1 
          @winning_move << index
        end
      end
    end
    @winning_move
  end

  def computer_player_winning_move
    computer_player
    @cells[@winning_move[0]] = 'x'
    @cells
  end

  def block_move
    @blocking_moves = []
    @cells.each_with_index do |check_if_block,index|
    if @cells[index] == ' '
      @cells[index] = 'o'
      score = @score.x_score_draw
      @cells[index] = ' '
        if score == 0
          @blocking_moves << index
        end
      end
    end
     @blocking_moves
    end

  def computer_player_blocking_move
    block_move
    @cells[@blocking_moves[0]] = 'x'
    @cells
  end

  def computer_win_over_block
    winning_position = []
    @cells.each_with_index do |check_win,index|
      if @cells[index] == ' '
        @cells[index] = 'x'
        score = @score.x_score_win
        @cells[index] = 'o'
        alternative_score = @score.x_score_draw
        @cells[index] = ' '
        if score > alternative_score
          @cells[index] = 'x'
        end
      end
    end
  end

end


