module BookDeals
  class Launcher
    attr_accessor :input_output

    def initialize(io = CLI.new)
      self.input_output = io
    end

    def start
      self.greet_user
      self.display_menu
    end

    def greet_user
      self.input_output.say "Welcome to Book Deals"
      self.input_output.say "----------------------"
    end

    def display_menu
      self.input_output.say "Select the Category for the deals:"
      self.input_output.say "1. All Deals (Press 1 to see All deals)"
      self.input_output.say "2. Best Sellers (Press 2 to see Best Sellers)"
      self.input_output.say "3. Fiction (Press 3 to see Fiction)"
      self.input_output.say "4. Biographies (Press 4 to see Biographies)"
      self.input_output.say "5. Technology (Press 5 to see Technology)"
      self.input_output.say "6. Young Adults (Press 6 to see Young Adults)"
    end
  end
end
