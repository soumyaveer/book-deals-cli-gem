module BookDeals
  class Launcher
    attr_accessor :input_output

    def initialize(io = CLI.new)
      self.input_output = io
    end

    def launch
      self.greet_user
      self.display_menu
      self.select_category
    end

    def start
      until user_has_quit
        self.launch
      end
      user_has_quit = self.does_user_wants_to_quit?
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

    def select_category
      category_choice = self.input_output.ask
      case category_choice
        when "1"
          self.input_output.say "You have selected ALL DEALS"
        when "2"
          self.inout_output.say "You have selected BEST SELLERS"
        when "3"
          self.input_output.say "You have selected FICTION"
        when "4"
          self.input_output.say "You have selected BIOGRAPHIES"
        when "5"
          self.input_output.say "You have selected TECHNOLOGY"
        when "6"
          self.input_output.say "You have selected YOUNG ADULTS"
        else
          self.input_output.say "Please select options 1 to 6"
          raise "Wrong choice type"
      end
    end
  end
end
