class Board
HORIZONTAL_WINS = [0,1,2],
                  [3,4,5],
                  [6,7,8]

VERTICAL_WINS = [0,3,6],
                [1,4,7],
                [2,5,8]

DIAGONAL_WINS = [0,4,8],
                [2,4,6]

attr_reader :cells

  def initialize(input,output,cells)
    @input = input
    @output = output
    @cells = cells
  end

  def make_move(index, current_player)
    @cells[index] = current_player   
    @cells
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

  def current_player(move_count)
    if move_count % 2 == 0
      current_player = :x
    else
      current_player = :o 
    end
  end

  def player_indicies(cells)
    @x_indicies = []
    @o_indicies = []
    cells.each_with_index do |cell,index|
      if cell == :x
        @x_indicies << index
      elsif cell == :o
        @o_indicies << index
      end
    end
  end

  def any_won?
    player_indicies(@cells)
    if vertical_win?(@x_indicies) == true ||
      horizontal_win?(@x_indicies) == true || 
      diagonal_win?(@x_indicies) == true || 
      vertical_win?(@o_indicies) == true || 
      horizontal_win?(@o_indicies) == true || 
      diagonal_win?(@o_indicies) == true
      return true
    else
      false
    end
  end

  def draw?
    any_won? == false
  end

  def game_over?
    any_won? == true || board_not_full? == false
  end

  def horizontal_win?(horizontal_win_indicies)
    HORIZONTAL_WINS.each do |winning_row|
      if (winning_row - horizontal_win_indicies).empty?
        return true
      end
    end
  end

  def diagonal_win?(diagonal_win_indicies)
    DIAGONAL_WINS.each do |winning_row|
      if (winning_row - diagonal_win_indicies).empty?
        return true
      end
    end
  end

  def vertical_win?(vertical_win_indicies)
    VERTICAL_WINS.each do |winning_row|
      if (winning_row - vertical_win_indicies).empty?
        return true
      end
    end
  end

end
