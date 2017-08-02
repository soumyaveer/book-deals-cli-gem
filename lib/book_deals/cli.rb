module BookDeals
  class CLI
    def ask
      gets.chomp
    end

    def say(output)
      puts output
    end
  end
end
