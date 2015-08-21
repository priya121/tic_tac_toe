require 'score'
require 'player'

class ComputerPlayer
  def initialize(cells,input,output)
    @cells = cells
    @score = Score.new(@cells,@input,@output)
    @board = Board.new(@cells,@input,@output)
    @move_count = 0
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
    if @board.game_over? == true
      return @score.score
    else
      @scores_for_move = {}
      @moves_index = []
      index_of_all_moves(game_state).each do |move|
        new_game_state = game_state
        new_game_state[move] = current_player
        @move_count += 1
        puts new_game_state.inspect
        puts @move_count
        @scores_for_move[move] = (minimax_score(new_game_state,current_player))
        current_player = switch_player(current_player)
        @moves_index << move
        new_game_state[move] = ' '
      end
    end
    puts @scores_for_move.inspect
    @scores_for_move.key(10)
  end

  def best_move(game_state,current_player)
    index = minimax_score(game_state,current_player)
    @cells[index] = "#{current_player}"
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
