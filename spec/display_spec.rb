require 'display' 

describe Display do
  let(:output) {StringIO.new('')}
  let(:cells) {[" "," "," "," "," "," "," "," "," "]}

  it 'displays a 3 by 3 board' do 
    Display.new(cells,output).display_board(cells)
    expect(output.string).to include("' '\t' '\t' '")
 end

  it "marks the grid with player one's move" do 
    output = StringIO.new("")
    cells = ["x"," "," ","o"," "," ","o","x"," "]
    Display.new(cells,output).display_board(cells)
    expect(output.string.split("\n")[1]).to include("x")
    expect(output.string.split("\n")[3]).to include("o")
    expect(output.string.split("\n")[5]).to include("o")
    expect(output.string.split("\n")[5]).to include("x")
  end

end
