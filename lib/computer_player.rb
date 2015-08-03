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
        score = @score.score
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
      score = @score.score
      @cells[index] = ' '
        if score == 1 
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

end

