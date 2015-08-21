require 'game'

describe Game do
  EMPTY_BOARD = [' ',' ',' ',' ',' ',' ',' ',' ',' ']

  let(:input) {StringIO.new('')}
  let(:output) {StringIO.new('')}
  let(:board) {output.string.split("\n")}

  it 'returns a computer player move automatically when a human move has been made' do 
    input = StringIO.new("1\n5\n8")
    new_board = [' ',' ',' ',
                 ' ',' ',' ',
                 ' ',' ',' ']
    result = Game.new(new_board,input,output).computer_player
    expect(result).to include('o')
  end

  it 'adds to the move score everytime a move is made by computer or human player' do 
    cells = [" "," "," ",
             " "," "," ",
             " "," "," "]
    expect(Game.new(cells,input,output).current_player(3)).to eq(:o)
  end
end
