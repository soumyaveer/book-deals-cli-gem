module BookDeals
  class CLI
    def ask
      puts "\n"
      self.say("Enter your selection:".colorize(:blue))
      gets.chomp
    end

    def say(output)
      puts "\n"
      puts output
    end
  end
end
