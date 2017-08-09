module BookDeals
  # manages user interaction with the scraper

  class Launcher
    attr_accessor :input_output, :scraper

    def does_user_wants_to_quit?
      self.input_output.say "Do you want to continue viewing deals? (y/n)".colorize(:blue)
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
      @categories = []

      @selected_category = nil
    end

    def display_deals
      self.input_output.say "Deals for Category - #{@selected_category.name}".colorize(:green)
      self.input_output.say "--------------------------------------".colorize(:green)
      @selected_category.books.each do |book|
        self.input_output.say book.to_s
      end

      self.display_total_book_deals_in_category
    end

    def display_total_book_deals_in_category
      self.input_output.say "Total #{@selected_category.books.count} deal/deals found for category #{@selected_category.name}.".colorize(:green)
      self.input_output.say "=============================================================================="
    end

    def good_bye
      self.input_output.say "Thank you for visiting BookDeals. Hope to see you soon. Goodbye!".colorize(:green)
    end

    def start
      loop do
        self.greet_user
        self.display_menu
        self.select_category
        break if self.does_user_wants_to_quit?
      end
      self.good_bye
    end

    def select_category
      category_choice = self.input_output.ask
      number_of_categories = @categories.count
      if category_choice.to_i.between?(1, number_of_categories)
        category = @categories[category_choice.to_i - 1]

        @selected_category = self.scraper.scrape_deals_from_category_page(category)
        self.display_deals
      else
       self.wrong_choice_selection
      end
    end

    def wrong_choice_selection
      self.input_output.say "The category selected is not present!".colorize(:red)
      self.input_output.say "Please select from options 1 to #{number_of_categories}".colorize(:red)
      self.display_menu
      self.select_category
    end
  end
end
