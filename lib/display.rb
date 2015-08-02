class Display
  def initialize(cells,output)
    @cells = cells
    @output = output
  end

  def display_board(cells)
    @output.print "\n"
    cells.each_with_index do |cell,index|
      @output.print "'#{cell}'\t"
      if index == 2 || index == 5
        @output.print "\n"
        @output.print "\n"
      end
    end
    @output.print "\n"
  end

end
