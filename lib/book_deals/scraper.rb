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

    def scrape_deals_from_category_page(category)
      #1. scrape deals in books from category page
      #class = "gr-deal"
      #  class = '.gr-mediaBox__desc'
      #    class = '.gr-book__title'
      #      href = show link for book -element a
      #  class="gr-book__author " ,element - a
      #  class="gr-book__additionalContent"
      #    categories - class="gr-deal__tag"
      #    description - class = "gr-deal__blurb" - element span
      #    price - class="deal__price__deal"
      #    original_price - class="gr-deal__price__original"
      end
  end
end
