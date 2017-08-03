require "nokogiri"
require "open-uri"
require "pry"

module BookDeals
  class Scraper
    BOOK_DEALS_URL = "https://www.goodreads.com/ebook-deals"

    def get_page
      Nokogiri::HTML(open(BOOK_DEALS_URL))
    end
  end
end
