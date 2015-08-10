require 'player'

describe Players do 
  let(:board) {[" "," "," "," "," "," "," "," "," "]}
  let(:output) {StringIO.new("")}
  it 'takes an input from player 1' do 
    input = StringIO.new('1')
    marked_board = Players.new(board,input,output).player_one_move
    expect(marked_board).to include("x")
  end
  
  it 'takes an input from player 1' do 
    input = StringIO.new('1')
    marked_board = Players.new(board,input,output).player_two_move
    expect(marked_board).to include("o")
  end

  it 'only allows a mark to be made if there is an empty space' do
    marked_board = ["x"," "," "," "," "," "," "," "," "]
    input = StringIO.new("1\n2\n")
    marked_board = Players.new(marked_board,input,output).player_one_move
    expect(output.string).to include("position occupied, try again")
  end

  it 'counts the move number or depth from the player' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    expect(Players.new(board,input,output).move_count).to eq(8)
  end

end
