require 'score'
require 'player'

class ComputerPlayer
  def initialize(cells,input,output)
    @cells = cells
    @score = Score.new(@cells)
    @board = Board.new(@cells)
    @players = Players.new(@cells,@input,@output)
  end

  def all_moves(game_state)
    @scores = []
    @index_of_all_moves = []
    game_state.each_with_index do |place_x,index|
      if game_state[index] == ' '
        @index_of_all_moves << index
      end
    end
    @index_of_all_moves
  end

  def index_of_all_moves(game_state)
    all_moves(game_state)
    @index_of_all_moves
  end

  def minimax_score(game_state,current_player)
    if @board.board_not_full? != true || @board.any_x_winners?(game_state) == true || @board.any_o_winners?(game_state) == true
      return @score.x_score(game_state)
    else
      @results = {}
      @moves = []
      index_of_all_moves(game_state).each do |move|
        new_game_state = game_state
        new_game_state[move] = current_player
        puts new_game_state.inspect
        @results[move] = (minimax_score(new_game_state,switch_player(current_player)))
        @moves << move
        new_game_state[move] = ' '
      end
    end
    @results.inspect
    @choice = best_position(current_player, @results)
    end

    def best_position(current_player, scores)
    if current_player == 'x'
      puts scores
      scores.each do |key,value|
        return key
      end
    elsif
      current_player == 'o'
      puts scores
      scores.each do |key,value|
        return key
      end
    end
  end

  def best_move(game_state)
    index = minimax_score(game_state,current_player = 'o')
    if @board.check_empty?(index) == true
      @cells[index] = 'x'
    end
    index
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


  def computer_player
    @winning_move = []
    @cells.each_with_index do |check_if_win, index|
      if @cells[index]  == ' ' 
        @cells[index] = 'x'
        score = @score.x_score
        @cells[index] = ' '
        if score == 1 
          @winning_move << index
        end
      end
    end
    @winning_move
  end

  def any_blocking_moves
    if computer_player_blocking_move != nil
      true
    else
      false
    end
  end

  def computer_player_winning_move
    if computer_player.size > 0
      @cells[@winning_move[0]] = 'x'
    else
      @cells = @cells
    end
    @cells
  end

  def block_move
    @blocking_moves = []
    @cells.each_with_index do |check_if_block,index|
      if @cells[index] == ' '
        @cells[index] = 'o'
        score = @score.x_score_draw
        @cells[index] = ' '
        if score == 0
          @blocking_moves << index
        end
      end
    end
    @blocking_moves
  end

  def computer_player_blocking_move
    block_move
    @cells[@blocking_moves[0]] = 'x'
    @cells
  end

  def computer_win_over_block
    winning_position = []
    @cells.each_with_index do |check_win,index|
      if @cells[index] == ' '
        @cells[index] = 'x'
        score = @score.x_score
        @cells[index] = 'o'
        alternative_score = @score.x_score_draw
        @cells[index] = ' '
        if score > alternative_score
          @cells[index] = 'x'
        end
      end
    end
  end

end
