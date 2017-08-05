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

    def scrape_categories_from_home_page
      category_html_elements = self.get_page.css(".gr-dealsCategoryExplorer .u-unstyledListItem li a")
      category_html_elements.map do |html_element|
        {
          name: html_element.text,
          category_url: HOME_URL + html_element.attr("href")
        }
      end
    end

    def scrape_deals_from_category_page
      #1. scrape deals in books from category page
      deals_html_doc = Nokogiri::HTML(open("https://www.goodreads.com/ebook-deals/today-only-book-deals"))
      deals_html_elements = deals_html_doc.css(".gr-deals .visibleWide")

      deals_html_elements.map do |html_element|
        {
          title: html_element.css(".gr-book__title").text,
          author: html_element.css(".gr-book__author a").text,
          categories: html_element.css(".gr-deal__tag").text,
          description: html_element.css(".gr-deal__blurb").text,
          deal_price: html_element.css(".gr-deal__price__deal").text,
          original_price: html_element.css(".gr-deal__price__original strike").text,
          deal_expiration_datetime: html_element.css(".gr-deal__expirationDate").text.split(" ").drop(1)
        }
      end
    end
  end
end
