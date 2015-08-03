require 'score'

class ComputerPlayer
  def initialize(cells)
    @cells = cells
    @score = Score.new(@cells)
  end

  def computer_player
    winning_move = []
    tie_move = []
    @cells.each_with_index do |check_if_win, index|
      if @cells[index]  == ' ' 
        @cells[index] = 'x'
        score = @score.score
        @cells[index] = ' '
        if score == 1 
          winning_move << index
        end
      end
    end
    winning_move
  end
end
