module BookDeals
  class Launcher
    attr_accessor :input_output, :scraper, :category

    def does_user_wants_to_quit?
      self.input_output.say "Do you want to continue viewing deals?".colorize(:blue)
      answer = self.input_output.ask
      %w(n no exit).include?(answer.downcase)
    end

    def display_menu
      self.input_output.say "Select a Category to see the deals:".colorize(:blue)
      @categories = self.scraper.scrape_categories_from_home_page
      @categories.each_with_index do |category, index|
        category_number = index + 1
        self.input_output.say "#{category_number}. #{category.name} (Press #{category_number} to see #{category.name})"
      end
    end

    def greet_user
      self.input_output.say "Welcome to Book Deals!!".colorize(:green)
      self.input_output.say "=======================".colorize(:green)
    end

    def initialize(io = CLI.new, scraper = Scraper.new)
      self.input_output = io
      self.scraper = scraper
    end

    def display_deals
      self.input_output.say "Deals for Category - #{@category.name}".colorize(:green)
      self.input_output.say "--------------------------------------".colorize(:green)
      @category.books.each do |book|
        self.input_output.say book.to_s
      end

      self.display_total_book_deals_in_category
    end

    def display_total_book_deals_in_category
      self.input_output.say "Total #{@category.books.count} deal/deals found for category #{@category.name}.".colorize(:green)
      self.input_output.say "=============================================================================="
    end

    def start
      user_has_quit = false

      until user_has_quit
        self.greet_user
        self.display_menu
        self.select_category
        user_has_quit = self.does_user_wants_to_quit?
      end
    end

    def select_category
      category_choice = self.input_output.ask

      if category_choice.to_i.between?(1, @categories.count)
        category_name = @categories[category_choice.to_i - 1]

        @category = self.scraper.scrape_deals_from_category_page(category_name)
        self.display_deals
      else
        self.input_output.say "Please select from options 1 to 9"
        raise "Wrong choice type"
      end
    end
  end
end
