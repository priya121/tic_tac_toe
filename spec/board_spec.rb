require 'board'

describe Board do
  it 'generates a board' do 
    expect(Board.generate_empty_board).to eq([' ',' ',' ',
                                              ' ',' ',' ',
                                              ' ',' ',' '])
  end

  it 'checks if a position is empty and if it is returns true' do 
    input = StringIO.new("")
    expect(Board.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']).check_empty?(2)).to eq(true)
  end

  it 'checks if a position is empty and if not returns false' do 
    expect(Board.new([' ',' ','x',' ',' ',' ',' ',' ',' ']).check_empty?(2)).to eq(false)
  end

  describe '#any_winners?' do
    it 'returns true if a winning position is found for x' do 
    cells = ['x','x','x',' ',' ',' ',' ',' ',' ']
    expect(Board.new(cells).any_x_winners?([' ',' ','x',' ','x',' ','x',' ',' '])).to eq(true)
    end

    it 'retrun true if a winning position is found for x' do 
    cells = ['o','o','o',
             ' ',' ',' ',
             ' ',' ',' ']
    expect(Board.new(cells).any_o_winners?(['o','o','o',' ','x',' ','x',' ',' '])).to eq(true)
    end
  end

  describe '#winning moves' do
      board = ([' ',' ',' ',' ',' ',' ',' ',' ',' '])
    
    it 'wins when the first row is all x' do 
      marked_board = ['x','x','x',' ',' ',' ',' ',' ',' ']
      expect(Board.new(board).x_winning_positions(marked_board)).to eq([:top_row_win])
    end

    it 'wins when the left hand column is all x' do 
      expect(Board.new(board).x_winning_positions(['x',' ',' ','x',' ',' ','x',' ',' '])).to eq([:left_side_win])
    end

    it 'wins when there is a diagonal from top right win for x' do 
      expect(Board.new(board).x_winning_positions([' ',' ','x',
                                                   ' ','x',' ',
                                                   'x',' ',' '])).to eq([:diagonal_from_top_right])
    end

    it 'returns true if there is a winner' do 
    cells = ['o','o','o',
             ' ',' ',' ',
             ' ',' ',' ']
    expect(Board.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']).any_won?([1,4,2,5,7])).to eq(true)
    end
  end
end
