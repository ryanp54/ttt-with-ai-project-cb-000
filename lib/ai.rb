class AI
  DEFAULT_MOVE_VALUES = {'1': 2, '2': 1, '3': 2, '4': 1, '5': 8, '6': 1, '7': 2, '8':1, '9':2}
  attr_accessor :player, :board, :win_combos, :moves

  def initialize(player, board)
    @player = player
    @board = board
    @win_combos = Game::WIN_COMBINATIONS
    @moves = DEFAULT_MOVE_VALUES
  end

  def think
    find_avaiable_moves
    find_remaining_wins
    if critical_moves
      moves
    else
      rank_moves
    end
  end

end
