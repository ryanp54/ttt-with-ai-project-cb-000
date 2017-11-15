module Players
  class Human < Player

    def move(selection)
      puts "Enter move:"
      gets.strip
    end
  end
end
