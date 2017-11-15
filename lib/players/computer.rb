module Players
  class Computer < Player
    attr_accessor :ai

    WIN_COMBOS = Game::WIN_COMBINATIONS
    def move(board)
      #ai = AI.new(self, board)

      sleep(Game::CLI_DELAY)
      best_move = winning_move(board)
      if !best_move
        best_moves = get_best_moves(board)
        best_move = best_moves[rand(0..best_moves.size-1)]
      end
      puts "#{self.token} selects #{best_move}"
      puts ""
      sleep(Game::CLI_DELAY)
      best_move.to_s
    end

    def winning_move(board)
      WIN_COMBOS.collect do |combo|
        if combo.select { |position| board.cells[position] == self.token }.size == 2
          i = combo.find_index { |n| !board.taken?(n + 1) }
          combo[i] + 1 if i
        end
      end.compact[0]
    end

    def get_best_moves(board)
      board.cells.collect.with_index { |cell, i| i + 1 if !board.taken?(i + 1) }.compact
    end

  end
end
