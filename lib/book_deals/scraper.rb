require "nokogiri"
require "open-uri"
require "pry"

module BookDeals
  class Scraper
    attr_accessor :category

    HOME_URL = "https://www.goodreads.com"
    BOOK_DEALS_URL = HOME_URL + "/ebook-deals"
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

    def scrape_categories_from_home_page
      category_html_elements = self.get_page.css(HOME_PAGE_HTML_ELEMENTS)
      category_html_elements = category_html_elements.select {|html_element| html_element.text!= "Recommended for You"}
      category_html_elements.map do |html_element|
        category = Category.new(html_element.text)
        category.url =  HOME_URL + html_element.attr("href")
        category
      end
    end

    def scrape_deals_from_category_page(category)
      deals_html_doc = Nokogiri::HTML(open(category.url))
      deals_html_elements = deals_html_doc.css(CATEGORY_PAGE_HTML_ELEMENTS)
      deals_html_elements.each do |html_element|
        @prices = deal_prices(html_element)
        @original_prices = original_prices(html_element)
        @expiration_dates = expires_in(html_element)
        @titles = book_titles(html_element)
        @authors = book_authors(html_element)
        @descriptions = book_descriptions(html_element)
        create_deals(category)
      end
      category
    end

    private

    def deal_prices(html_element)
      prices = html_element.css(DEALS_HTML_ELEMENT_DEAL_PRICE)
      prices.map { |price| price.text }
    end

    def original_prices(html_element)
      original_prices = html_element.css(DEALS_HTML_ELEMENT_ORIGINAL_PRICE)
      original_prices.map {|original_price| original_price.text}
    end

    def expires_in(html_element)
      expiration_dates = html_element.css(DEALS_HTML_ELEMENT_DATETIME)
      expiration_dates.map {|datetime| datetime.text}.map {|time| time.split(" ").drop(2).join(" ")}
    end

    def book_titles(html_element)
      titles = html_element.css(DEALS_HTML_ELEMENT_TITLE)
      titles.map {|title| title.text}
    end

    def book_authors(html_element)
      authors = html_element.css(DEALS_HTML_ELEMENT_AUTHOR)
      authors.map {|author| author.text}
    end
  end
end
