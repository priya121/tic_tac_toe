require 'score'

describe Score do 
  it 'adds +1 to the score if a winning position is found for x' do
    cells = ['x','x','x',' ',' ',' ',' ',' ',' ']
    expect(Score.new(cells).score).to eq(1)
  end

end
