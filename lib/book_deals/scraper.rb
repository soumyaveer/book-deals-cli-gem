require "nokogiri"
require "open-uri"
require "pry"

module BookDeals
  class Scraper
    HOME_URL = "https://www.goodreads.com"
    BOOK_DEALS_URL = HOME_URL + "ebook-deals"

    def get_page
      Nokogiri::HTML(open(BOOK_DEALS_URL))
    end

    def scrape_deals_url
      categories_explorer = self.get_page.css(".gr-dealsCategoryExplorer .u-unstyledListItem li a")
      categories_explorer.map do |category|
        {
         name: category.text,
         category_url: category.attr("href")
        }
      end
    end

    def generate_category_url
      self.scrape_deals_url.each do |category|
        category.each do |attribute, value|
          category[attribute] =  HOME_URL + value if attribute == :category_url
        end
      end
    end

    def scrape_category_deal_url

    end
  end
end
