require "nokogiri"
require "open-uri"
require "pry"

module BookDeals
  class Scraper
    BOOK_DEALS_URL = "https://www.goodreads.com/ebook-deals"

    def get_page
      Nokogiri::HTML(open(BOOK_DEALS_URL))
    end

    def scrape_deals_url
      categories_explorer = self.get_page.css(".gr-dealsCategoryExplorer .u-unstyledListItem li a")
      categories_explorer.map do |category|
        {
         name: category.text,
         category_deal_url: category.attr("href")
        }
      end
    end
  end
end
