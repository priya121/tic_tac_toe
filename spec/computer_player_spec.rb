require 'computer_player'

describe ComputerPlayer do 

  it "doesn't return an index when it can only make a move that results in a tie" do 
    cells = ['x','x','o','o','o','x','x','o','x']
    input = StringIO.new("1\n2\n")
    expect(ComputerPlayer.new(cells).computer_player).to eq([])
  end

  it 'returns an index if it is a winning move' do
    cells = ['o','x','o','x',' ','x','o','o',' ']
    input = StringIO.new("1\n2\n")
    expect(ComputerPlayer.new(cells).computer_player).to eq([4])


  end

end
