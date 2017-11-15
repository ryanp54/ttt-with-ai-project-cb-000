module Players
  class Human < Player

    def move(board)
      puts "Enter move:"
      selection = gets.strip
      puts "#{self.token} selects #{selection}"
      puts ""
      puts ""
      sleep(0.5)
      selection
    end
  end
end
