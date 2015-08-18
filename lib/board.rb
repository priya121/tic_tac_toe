class Board
  def initialize(cells)
    @cells = cells
  end

  def self.generate_empty_board
    Array.new(9,' ')
  end
  
  def check_empty?(index)
    @cells[index] == " "
  end

  def board_not_full?
    @cells.include?(" ")
  end

  def winning_positions
    won = [[0,1,2], 
           [0,3,6],
           [6,7,8],
           [8,5,2],
           [3,4,5],
           [1,4,7],
           [0,4,8],
           [2,4,8]]
  end

  def player_indicies(cells,player)
    @x_indicies = []
    @o_indicies = []
    cells.each_with_index do |cell,index|
      if cell == 'x'
        @x_indicies << index
      elsif cell == 'o'
        @o_indicies << index
      end
    end
  end

  def any_won?(indicies)
    won = []
    i = 0 
    n = 0
    winning_positions.each do |winning_combination|
      indicies.each do |winner|
        if winner == winning_combination[n]
          won << winner 
        end
      end
      n += 1
    end
    puts won.inspect
  end

  def any_x_winners?(cells)
    x_winning_positions(cells).size > 0
  end

  def any_o_winners?(cells)
    o_winning_positions(cells).size > 0
  end

  def x_winning_positions(cells)
    win = {:top_row_win => cells[0] == 'x' && cells[1] == 'x' && cells[2] == 'x',
      :left_side_win => cells[0] == 'x' && cells[3] == 'x' && cells[6] == 'x',           
      :bottom_row_win => cells[6] == 'x' && cells[7] == 'x' && cells[8] == 'x',          
      :right_side_win => cells[8] == 'x' && cells[5] == 'x' && cells[2] == 'x',          
      :middle_row_win => cells[3] == 'x' && cells[4] == 'x' && cells[5] == 'x', 
      :middle_column_win => cells[1] == 'x' && cells[4] == 'x' && cells[7] == 'x', 
      :diagonal_from_top_left => cells[0] == 'x' && cells[4] == 'x' && cells[8] == 'x', 
      :diagonal_from_top_right => cells[2] == 'x' && cells[4] == 'x' && cells[6] == 'x'}

    @x_winners = []
    win.each_with_index do |(check_move,cells),index|
    if cells == true
      @x_winners << check_move
    end
    end
    @x_winners
  end

  def o_winning_positions(cells)
    o_win = {
      :o_top_row_win => cells[0] == 'o' && cells[1] == 'o' && cells[2] == 'o',
      :o_left_side_win => cells[0] == 'o' && cells[3] == 'o' && cells[6] == 'o',           
      :o_bottom_row_win => cells[6] == 'o' && cells[7] == 'o' && cells[8] == 'o',          
      :o_right_side_win => cells[8] == 'o' && cells[5] == 'o' && cells[2] == 'o',          
      :o_middle_row_win => cells[3] == 'o' && cells[4] == 'o' && cells[5] == 'o', 
      :o_middle_column_win => cells[1] == 'o' && cells[4] == 'o' && cells[7] == 'o', 
      :o_diagonal_from_top_left => cells[0] == 'o' && cells[4] == 'o' && cells[8] == 'o', 
      :o_diagonal_from_top_right => cells[2] == 'o' && cells[4] == 'o' && cells[6] == 'o'}

      @o_winners = []
      o_win.each_with_index do |(check_move,cells),index|
      if cells == true
        @o_winners << check_move
      end
      end
      @o_winners
  end
end
