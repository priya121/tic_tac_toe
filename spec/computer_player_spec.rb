require 'computer_player'

describe ComputerPlayer do 

  it "doesn't return an index when it can only make a move that results in a tie" do 
    cells = ['x','x','o','o','o','x','x','o','x']
    expect(ComputerPlayer.new(cells).computer_player).to eq([])
  end

  it 'returns an index if it is a winning move' do
    cells = ['o','x','o','x',' ','x','o','o',' ']
    expect(ComputerPlayer.new(cells).computer_player).to eq([4])
  end

  it 'makes a winning move over a move that results in a tie' do
    cells = ['o','x','o','x',' ','x','o','o',' ']
    expect(ComputerPlayer.new(cells).computer_player_winning_move).to eq(['o','x','o','x','x','x','o','o',' '])
    expect(ComputerPlayer.new(cells).computer_player_winning_move).to_not eql(['o','x','o',' ','x','x','o','o','x'])
  end

 it "stops the human player from winning" do 
    cells = ['o',' ','o','x','x','o',' ','o','x']
    expect(ComputerPlayer.new(cells).computer_player_blocking_move).to eq(['o','x','o','x','x','o',' ','o','x'])
    
 end
end


