require 'computer_player'

describe ComputerPlayer do 
  let (:input) {StringIO.new('')}
  let (:output) {StringIO.new('')}

 xit 'makes a winning move over a blocking move' do 
    cells = ['o',' ','o',
             'x',' ','x',
             'o','x','x']
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(4)
 end

 it 'asseses all the possible moves and subsequent scores of all moves' do 
    cells = ['o',' ','o',
             'x',' ','x',
             'o','x',' ']
    expect(ComputerPlayer.new(cells,input,output).index_of_all_moves(cells)).to eq([1,4,8])
 end

 it 'returns the score of x if game is over' do 
    cells = ['o','o','o',
             'x',' ','x',
             'o','x','x']
    expect(ComputerPlayer.new(cells,input,output).minimax_score(cells,current_player = 'x')).to eq(- 10)
 end

 xit 'checks if it is the computer players turn and returns the max score and index' do 
    cells = ['o',' ','x',
             'x',' ','o',
             'x','o','o']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).minimax_score(cells,current_player)).to eq([''])
 end

 it 'checks if it is the computer players turn and returns the best move' do 
    cells = [' ','x','x',
             ' ',' ',' ',
             'x','o','x']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(0)
 end

 it 'checks if it is the computer players turn and returns the best move' do 
    cells = ['o','o','x',
             'x',' ',' ',
             'x','o','x']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(4)
 end

 it 'returns a score of 0 if the end board is a draw' do
    cells = ['o','x','o',
             'x','o','o',
             'x','o','x']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).minimax_score(cells,current_player)).to eq(0)
 end

 it 'returns a score of 10 if x wins' do
    cells = ['o','x','o',
             'x','o','o',
             'x','x','x']
    current_player = 'o'
    expect(ComputerPlayer.new(cells,input,output).minimax_score(cells,current_player)).to eq(10)
 end

 it 'returns a score of -10 if o wins' do
    cells = ['o','x','x',
             'o','o','o',
             'x','o','x']
    current_player = 'o'
    expect(ComputerPlayer.new(cells,input,output).minimax_score(cells,current_player)).to eq(-10)
 end
 it 'checks if it is the computer players turn and returns the best move' do 
    cells = [' ','x',' ',
             'x',' ','x',
             'x','o','o']
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(0)
 end

 it 'switches between players' do 
    cells = ['o',' ','x',
             'x',' ','o',
             'x','o','o']
    expect(ComputerPlayer.new(cells,input,output).switch_player('x')).to eq('o')
    expect(ComputerPlayer.new(cells,input,output).switch_player('o')).to eq('x')
 end

 it 'checks if it is the computer players turn returns best move' do 
    cells = ['o','x','x',
             'x','o','o',
             ' ',' ',' ']
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(8)
 end

 xit 'checks if it is the computer players turn returns best move' do 
    cells = [' ',' ','x',
             'o',' ',' ',
             'x','o','o']
    current_player = 'o'
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(4)
 end

 it 'checks if it is the computer players turn returns best move' do 
    cells = ['x',' ','x',
             'o',' ',' ',
             ' ','o','o']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(1)
 end

 it 'checks if it is the computer players turn returns best move' do 
    cells = ['x',' ',' ',
             'o','x','o',
             ' ','o','o']
    current_player = 'x'
    expect(ComputerPlayer.new(cells,input,output).best_move(cells)).to eq(2)
 end
end


