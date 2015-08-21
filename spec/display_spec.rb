require 'display' 

describe Display do
  let(:output) {StringIO.new('')}
  let(:cells) {[" "," "," "," "," "," "," "," "," "]}

  it 'displays a 3 by 3 board' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    Display.new(cells,input,output).display_board(cells)
    expect(output.string).to include("' '\t' '\t' '")
 end

  it "marks the grid with player one's move" do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    output = StringIO.new("")
    cells = ["x"," "," ","o"," "," ","o","x"," "]
    Display.new(cells,input,output).display_board(cells)
    expect(output.string.split("\n")[1]).to include("x")
    expect(output.string.split("\n")[3]).to include("o")
    expect(output.string.split("\n")[5]).to include("o")
    expect(output.string.split("\n")[5]).to include("x")
  end

  it 'asks player one to make a move' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    cells = [" "," "," "," "," "," "," "," "," "]
    Display.new(cells,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
  end

  it 'asks player one to make a move' do 
    input = StringIO.new("1\n2\n3\n4\n5\n6\n7\n8\n9")
    cells = [" "," "," ",
             " "," "," ",
             " "," "," "]
    Display.new(cells,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
  end

  it 'tells a player when the game has ended' do 
    input = StringIO.new("3\n4\n9")
    cells = ["x","o"," ",
             " ","o","x",
             "o","x"," "]
    Display.new(cells,input,output).game_loop
    expect(output.string).to start_with("Choose a position on the board")
    expect(output.string).to end_with("\nEnd of game.\n")
  end

  it 'tells a player when the game has ended' do 
    input = StringIO.new("3\n4\n9")
    cells = [" "," "," ",
             " "," "," ",
             " "," "," "]
   game = Display.new(cells,input,output).game_loop
   expect(game.move_count).to eq(6)
    
    
  end
end
