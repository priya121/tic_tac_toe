require 'board'

describe Board do
  let(:output) {StringIO.new('')}
  let(:input) {StringIO.new('')}

  it 'generates a board' do 
    expect(Board.generate_empty_board).to eq([' ',' ',' ',
                                              ' ',' ',' ',
                                              ' ',' ',' '])
  end

  it 'checks if a position is empty and if it is returns true' do 
    input = StringIO.new("")
    cells = [' ',' ',' ',
             ' ',' ', :o,
             ' ',' ', :o]
    Board.generate_empty_board
    expect(Board.new(input,output,cells).check_empty?(2)).to eq(true)
  end

  it 'returns vertical winning combination if there is one' do 
    input = StringIO.new("1\n2\n")
    output = StringIO.new("")
    cells = [' ',' ',' ' ,
             ' ',' ',:o,
             ' ',' ',:o]
    expect(Board.new(input,output,cells).any_won?).to eq(false)
  end

  it 'returns horizontal winning combination if there is one' do 
    input = StringIO.new("1\n2\n")
    output = StringIO.new("")
    cells = [:x,:x,:x,
             ' ',' ',' ',
             ' ',' ',' ']
    expect(Board.new(input,output,cells).any_won?).to eq(true)
  end

  it 'returns winning combination if there is one' do 
    input = StringIO.new("1\n2\n")
    output = StringIO.new("")
    cells = [:x,' ',:o,
             ' ',:x,:o,
             ' ',' ',:x]
    expect(Board.new(input,output,cells).any_won?).to eq(true)
  end

  it 'returns horizontal winning combination if there is one' do 
    input = StringIO.new("1\n2\n")
    output = StringIO.new("")
    cells = [:x,:o,:x,
             :o,:x,:o,
             :o,:x,:o]
    expect(Board.new(input,output,cells).any_won?).to eq(false)
    expect(Board.new(input,output,cells).draw?).to eq(true)
  end
end
