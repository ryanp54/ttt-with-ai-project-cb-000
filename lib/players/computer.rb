module Players
  class Computer < Player

    def move(board)
      best_moves = get_best_moves(board)
      best_move = best_moves[rand(0..best_moves.size-1)]
      puts "#{self.token} selects #{best_move}"
      puts ""
      puts ""
      sleep(0.5)
      best_move.to_s
    end

    def winning_move(board)
      WIN_COMBOS.collect do |combo|
        if combo.select { |position| board.cells[position] = self.token }.size == 2
          i = combo.find_index { |item| item != self.token }
          combo[i]
        end
      end.compact[0]
    end

    def get_best_moves(board)
      board.cells.collect.with_index { |cell, i| i + 1 if cell == "" || cell == " " }.compact
    end

  end
end
