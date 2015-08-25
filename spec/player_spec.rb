require 'player'

describe Player do 
  let(:board) {[" "," "," "," "," "," "," "," "," "]}
  let(:output) {StringIO.new("")}

  it 'takes an input from player 1' do 
    input = StringIO.new('1')
    marked_board = Player.new(input,output,board).player_make_move
    expect(marked_board).to include(:x)
  end

  it 'only allows a mark to be made if there is an empty space' do
    marked_board = [:x,:x," "," "," "," "," "," "," "]
    input = StringIO.new("1\n")
    Player.new(input,output,marked_board).player_make_move
    expect(output.string).to include("position occupied, try again")
  end

end
