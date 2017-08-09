require "spec_helper"

describe BookDeals::Scraper do
  let(:scraper) { BookDeals::Scraper.new }

  describe "get_book_deals_page" do
    it "returns html elements from the url" do
      doc = scraper.get_book_deals_page

      expect(doc.text).to include("Bestsellers")
    end
  end

  describe "scrape_categories_from_home_page" do
    it "scrapes all categories from the deals page" do
      categories = scraper.scrape_categories_from_home_page

      expect(categories.count).to eql(8)
    end

    it "scrapes all the categories names" do
      categories_names = []
      categories = scraper.scrape_categories_from_home_page
      categories.each {|category| categories_names << category.name}

      expect(categories_names).to match_array(["Today Only!", "Bestsellers", "Romance", "Mystery & Thrillers", "Fantasy & Science Fiction", "Fiction", "Nonfiction", "Young Adult" ])
    end

    it "scrapes all the category urls" do
      categories_urls = []
      categories = scraper.scrape_categories_from_home_page
      categories.each {|category| categories_urls << category.url}

      expect(categories_urls).to match_array(["https://www.goodreads.com/ebook-deals/today-only-book-deals",
                                             "https://www.goodreads.com/ebook-deals/bestsellers-book-deals",
                                             "https://www.goodreads.com/ebook-deals/romance-book-deals",
                                             "https://www.goodreads.com/ebook-deals/mystery-thrillers-book-deals",
                                             "https://www.goodreads.com/ebook-deals/fantasy-science-fiction-book-deals",
                                             "https://www.goodreads.com/ebook-deals/fiction-book-deals",
                                             "https://www.goodreads.com/ebook-deals/nonfiction-book-deals",
                                              "https://www.goodreads.com/ebook-deals/young-adult-book-deals"])
    end
  end
end
