class Board
  def initialize(cells)
    @cells = cells
  end

  def self.generate_empty_board(width,height)
    empty_grid = ''
    empty_cells = (" " * (width * height))
    empty_grid << empty_cells
    empty_grid.split(//)
  end
  
  def check_empty?(index)
    if @cells[index] == " "
      true
    else
      false
    end
  end

  def board_not_full?
    if @cells.include?(" ")
      true
    end
  end

  def any_winners?(cells)
    if winning_moves(cells).size > 0
      true
    end
  end
  
  def score 
    score = 0
    if any_winners?(@cells) == true 
      score = +1
    end
  end


  def winning_moves(cells)
    win = {:top_row_win => cells[0] == 'x' && cells[1] == 'x' && cells[2] == 'x',
      :left_side_win => cells[0] == 'x' && cells[3] == 'x' && cells[6] == 'x',           
      :bottom_row_win => cells[6] == 'x' && cells[7] == 'x' && cells[8] == 'x',          
      :right_side_win => cells[8] == 'x' && cells[5] == 'x' && cells[2] == 'x',          
      :middle_row_win => cells[3] == 'x' && cells[4] == 'x' && cells[5] == 'x', 
      :middle_column_win => cells[1] == 'x' && cells[4] == 'x' && cells[7] == 'x', 
      :diagonal_from_top_left => cells[0] == 'x' && cells[4] == 'x' && cells[8] == 'x', 
      :diagonal_from_top_right => cells[2] == 'x' && cells[4] == 'x' && cells[6] == 'x',
      :o_top_row_win => cells[0] == 'o' && cells[1] == 'o' && cells[2] == 'o',
      :o_left_side_win => cells[0] == 'o' && cells[3] == 'o' && cells[6] == 'o',           
      :o_bottom_row_win => cells[6] == 'o' && cells[7] == 'o' && cells[8] == 'o',          
      :o_right_side_win => cells[8] == 'o' && cells[5] == 'o' && cells[2] == 'o',          
      :o_middle_row_win => cells[3] == 'o' && cells[4] == 'o' && cells[5] == 'o', 
      :o_middle_column_win => cells[1] == 'o' && cells[4] == 'o' && cells[7] == 'o', 
      :o_diagonal_from_top_left => cells[0] == 'o' && cells[4] == 'o' && cells[8] == 'o', 
      :o_diagonal_from_top_right => cells[2] == 'o' && cells[4] == 'o' && cells[6] == 'o'}

    @winners = []
    win.each_with_index do |(check_move,cells),index|
    if cells == true
      @winners << check_move
    end
    end
    @winners
  end

end
