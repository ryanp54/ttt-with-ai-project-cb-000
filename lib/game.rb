class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player1 = Players::Human.new('X'), player2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect { |combo| combo.all? { |index| board.cells[index] == "X" } || combo.all? { |index| board.cells[index] == "O" } }
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || board.full? || draw?
  end

  def winner
    win = won?
    if win
      win = board.cells[win[0]]
    end
  end

  def turn
    complete = false
    player = current_player
    while !complete
      move = player.move(board)
      if board.valid_move?(move)
        board.update(move, player)
        complete = true
      end
    end
  end

  def play
    game_over = false
    while !game_over
      turn
      game_over = true if over? || won? || draw?
    end

    if winner
      puts "Congradulations #{winner}."
    else
      puts "Cat's Game!"
    end
  end

end
