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

  it 'scores making a winning move higher than a tie move' do 
    cells = ['o','x','o','x',' ','x','o','o',' ']
    input = StringIO.new("1\n2\n")
    expect(Players.new(cells,input,output).computer_player(4)).to eq(1)
  end

  it "doesn't score when it makes a move that results in a tie" do 
    cells = ['o','x','o','x',' ','x','o','o',' ']
    input = StringIO.new("1\n2\n")
    expect(Players.new(cells,input,output).computer_player(8)).to eq(0)
  end
end
