require "nokogiri"
require "open-uri"
require "pry"

module BookDeals
  class Scraper
    HOME_URL = "https://www.goodreads.com"
    BOOK_DEALS_URL = HOME_URL + "ebook-deals"
    HOME_PAGE_HTML_ELEMENTS = ".gr-dealsCategoryExplorer .u-unstyledListItem li a"
    CATEGORY_PAGE_HTML_ELEMENTS = ".gr-deals .visibleWide"
    DEALS_HTML_ELEMENT_TITLE = ".gr-book__title"
    DEALS_HTML_ELEMENT_AUTHOR = ".gr-book__author a"
    DEALS_HTML_ELEMENT_CATEGORIES = ".gr-deal__tag"
    DEALS_HTML_ELEMENT_DESCRIPTION = ".gr-deal__blurb"
    DEALS_HTML_ELEMENT_DEAL_PRICE = ".gr-deal__price__deal"
    DEALS_HTML_ELEMENT_ORIGINAL_PRICE = ".gr-deal__price__original strike"
    DEALS_HTML_ELEMENT_DATETIME = ".gr-deal__expirationDate"

    def get_page
      Nokogiri::HTML(open(BOOK_DEALS_URL))
    end

    # TODO: convert to objects instead of hash
    def scrape_categories_from_home_page
      category_html_elements = self.get_page.css(HOME_PAGE_HTML_ELEMENTS)
      category_html_elements.map do |html_element|
        {
          name: html_element.text,
          category_url: HOME_URL + html_element.attr("href")
        }
      end
    end

    # TODO: convert to objects instead of hash
    def scrape_deals_from_category_page
      deals_html_doc = Nokogiri::HTML(open("https://www.goodreads.com/ebook-deals/today-only-book-deals"))
      deals_html_elements = deals_html_doc.css(CATEGORY_PAGE_HTML_ELEMENTS)

      deals_html_elements.map do |html_element|
        {
          title: html_element.css(DEALS_HTML_ELEMENT_TITLE).text,
          author: html_element.css(DEALS_HTML_ELEMENT_AUTHOR).text,
          categories: html_element.css(DEALS_HTML_ELEMENT_CATEGORIES).text,
          description: html_element.css(DEALS_HTML_ELEMENT_DESCRIPTION).text,
          deal_price: html_element.css(DEALS_HTML_ELEMENT_DEAL_PRICE).text,
          original_price: html_element.css(DEALS_HTML_ELEMENT_ORIGINAL_PRICE).text,
          deal_expiration_datetime: html_element.css(DEALS_HTML_ELEMENT_DATETIME).text.split(" ").drop(1)
        }
      end
    end
  end
end
