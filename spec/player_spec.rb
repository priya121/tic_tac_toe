require 'player'

describe Player do 
  let(:board) {[" "," "," "," "," "," "," "," "," "]}
  let(:output) {StringIO.new("")}

  it 'takes an input from player 1' do 
    input = StringIO.new('1')
    marked_board = Player.new(board,input,output).player_move
    expect(marked_board).to include("x")
  end

  it 'only allows a mark to be made if there is an empty space' do
    marked_board = ["o"," "," "," "," "," "," "," "," "]
    input = StringIO.new("1\n2\n")
    marked_board = Player.new(marked_board,input,output).player_move
    expect(output.string).to include("position occupied, try again")
  end

end
