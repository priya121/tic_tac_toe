require 'score'
require 'player'

class ComputerPlayer
  def initialize(cells,input,output)
    @cells = cells
    @score = Score.new(@cells)
    @board = Board.new(@cells)
  end

  def all_available_moves(game_state)
    index_of_all_moves = []
    game_state.each_with_index do |place_x,index|
      if game_state[index] == ' '
        index_of_all_moves << index
      end
    end
    index_of_all_moves
  end

  def index_of_all_moves(game_state)
    all_available_moves(game_state)
  end

  def minimax_score(game_state,current_player)
    if @board.board_not_full? != true || @board.any_x_winners?(game_state) == true || @board.any_o_winners?(game_state) == true
      return @score.x_score(game_state)
    else
      @scores_for_move = {}
      @moves_index = []
      index_of_all_moves(game_state).each do |move|
        new_game_state = game_state
        new_game_state[move] = current_player
        @scores_for_move[move] = (minimax_score(new_game_state,switch_player(current_player)))
        @moves_index << move
        new_game_state[move] = ' '
      end
    end
    @scores_for_move
    @choice = @scores_for_move 
  end

  def best_move(game_state)
    index = minimax_score(game_state,'x')
    @cells[index] = 'o'
    @cells
  end

  def switch_player(current_player)
    if current_player == 'x'
      current_player = 'o'
    elsif
      current_player == 'o'
      current_player = 'x'
    end
    current_player
  end
end
