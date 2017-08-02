module BookDeals
  class Launcher
    attr_accessor :input_output

    def initialize(io = CLI.new)
      self.input_output = io
    end

    def start
      greet_user
      display_menu
    end
  end
end
