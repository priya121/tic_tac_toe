require 'tic_tac_toe'

describe TicTacToe do
  EMPTY_BOARD = [' ',' ',' ',' ',' ',' ',' ',' ',' ']

  let(:input) {StringIO.new('')}
  let(:output) {StringIO.new('')}

  it 'has three rows and three columns' do 
    expect(TicTacToe.new(EMPTY_BOARD,input,output).cells).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
  end

  it 'asks player one to make a move' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    TicTacToe.new(EMPTY_BOARD,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
    expect(output.string).to end_with("\nEnd of game.\n")
  end

  it 'ends the game when there is a winning move' do 
    input = StringIO.new("1\n4\n2\n5\n3")
    new_board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    TicTacToe.new(new_board,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
    expect(output.string).to include("Next player")
    expect(output.string).to end_with("\nEnd of game.\n")
  end

  it 'takes an input from both players - x and o' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    marked_board = TicTacToe.new(EMPTY_BOARD,input,output).game_loop
    expect(output.string).to include("o")
    expect(output.string).to include("x")
  end
end
