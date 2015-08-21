require 'score'

describe Score do 
  let(:input) {StringIO.new("")}
  let(:output) {StringIO.new("")}

  it 'return 10 for a score if a winning position is found for o' do
    cells = ['o','o','o',
             ' ',' ',' ',
             ' ',' ',' ']
    expect(Score.new(cells,input,output).score).to eq(10)
  end

  it 'return 10 for a score if a winning position is found for o' do
    input = StringIO.new("")
    output = StringIO.new("")
    marked_cells = ['x','o','o',
                    'o','o',' ',
                    'x','x','o']
    expect(Score.new(marked_cells,input,output).score).to eq(0)
  end

  it 'has a score of 0 if it is a tie' do
    cells = ['o',' ','o',
             ' ',' ',' ',
             ' ',' ',' ']
    expect(Score.new(cells,input,output).score).to eq(0)
  end

  it 'has a score of 10 if there is a win' do
    cells = ['o','x','o',
             'x',' ','x',
             'o','o','o']
    expect(Score.new(cells,input,output).score).to eq(10)
  end
end
