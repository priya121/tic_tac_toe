require 'score'

describe Score do 
  it 'adds +1 to the score if a winning position is found for x' do
    cells = ['x','x','x',' ',' ',' ',' ',' ',' ']
    expect(Score.new(cells).x_score(cells)).to eq(10)
  end

  it 'takes 1 away from the score if a winning position is found for o' do
    cells = ['o','o','o',' ',' ',' ',' ',' ',' ']
    expect(Score.new(cells).x_score_loss).to eq(- 1)
  end

  it 'has a score of 0 if it is a tie' do
    cells = ['o',' ','o',' ',' ',' ',' ',' ',' ']
    expect(Score.new(cells).x_score_draw).to eq(0)
  end

  it 'has a score of 0 if it is a tie' do
    cells = ['x','o','x',
             'x','o','x',
             'o','x','o']
    expect(Score.new(cells).x_score(cells)).to eq(0)
  end

  it 'has a score of 0 if it is a tie' do
    cells = ['o','x','o','x',' ','x','o','o','o']
    expect(Score.new(cells).x_score(cells)).to eq(- 10)
  end
end
