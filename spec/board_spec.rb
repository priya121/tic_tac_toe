require 'board'

describe Board do
  it 'generates a board' do 
    expect(Board.generate_empty_board(3,3)).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
  end

  it 'checks if a position is empty and if it is returns true' do 
    input = StringIO.new("")
    expect(Board.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']).check_empty?(2)).to eq(true)
  end

  it 'checks if a position is empty and if not returns false' do 
    expect(Board.new([' ',' ','x',' ',' ',' ',' ',' ',' ']).check_empty?(2)).to eq(false)
  end

  describe '#any_winners?' do
    it 'adds +1 to the score if a winning position is found for x' do 
    cells = ['x','x','x',' ',' ',' ',' ',' ',' ']
    expect(Board.new(cells).any_winners?([' ',' ','x',' ','x',' ','x',' ',' '])).to eq(true)
    expect(Board.new(cells).score).to eq(1)
    end
  end

  it 'returns true when there is a winning move' do
    cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    expect(Board.new(cells).any_winners?([' ',' ','x',' ','x',' ','x',' ',' '])).to eq(true)
  end

  describe '#winning moves' do
      board = ([' ',' ',' ',' ',' ',' ',' ',' ',' '])
    
    it 'wins when the first row is all x' do 
      expect(Board.new(board).winning_moves(['x','x','x',' ',' ',' ',' ',' ',' '])).to eq([:top_row_win])
    end

    it 'wins when the left hand column is all x' do 
      expect(Board.new(board).winning_moves(['x',' ',' ','x',' ',' ','x',' ',' '])).to eq([:left_side_win])
    end

    it 'wins when there is a diagonal from top right win for x' do 
      expect(Board.new(board).winning_moves([' ',' ','x',' ','x',' ','x',' ',' '])).to eq([:diagonal_from_top_right])
    end
  end
end
