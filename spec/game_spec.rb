require 'game'

describe Game do
  EMPTY_BOARD = [' ',' ',' ',' ',' ',' ',' ',' ',' ']

  let(:input) {StringIO.new('')}
  let(:output) {StringIO.new('')}
  let(:board) {output.string.split("\n")}

  it 'has three rows and three columns' do 
    expect(Game.new(EMPTY_BOARD,input,output).cells).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
  end

  it 'asks player one to make a move' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    Game.new(EMPTY_BOARD,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
    expect(output.string).to end_with("\nEnd of game.\n")
  end

  it 'ends the game when there is a winning move' do 
    input = StringIO.new("1\n4\n2\n5\n3")
    new_board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    Game.new(new_board,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
    expect(output.string).to include("Next player")
    expect(output.string).to end_with("\nEnd of game.\n")
  end

  it 'takes an input from both players - x and o' do 
    input = StringIO.new("1\n5\n8\n")
    new_board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    marked_board = Game.new(new_board,input,output).game_loop
    expect(output.string).to include("o")
    expect(output.string).to include("x")
    expect(board[0]).to include("o")
  end

  it 'returns a computer player move automatically when a human move has been made' do 
    input = StringIO.new("1\n5\n8\n")
    new_board = ['o',' ',' ',
                 ' ',' ',' ',
                 ' ',' ',' ']
    Game.new(new_board,input,output).game_loop
    expect(output.string).to include('x')
  end
end
