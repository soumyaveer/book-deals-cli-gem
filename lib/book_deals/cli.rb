module BookDeals
  class CLI
    def ask
      puts "\n"
      self.say("Enter your selection:")
      gets.chomp
    end

    def say(output)
      puts "\n"
      puts output
    end
  end
end
