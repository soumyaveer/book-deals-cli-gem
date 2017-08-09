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
    before do
      @categories = scraper.scrape_categories_from_home_page
    end

    it "scrapes all categories from the deals page" do
      # categories = scraper.scrape_categories_from_home_page

      expect(@categories.count).to eql(8)
    end

    it "scrapes all the categories names" do
      category_names = []
      # categories = scraper.scrape_categories_from_home_page
      @categories.each {|category| category_names << category.name}

      expect(category_names).to match_array(["Today Only!", "Bestsellers", "Romance", "Mystery & Thrillers", "Fantasy & Science Fiction", "Fiction", "Nonfiction", "Young Adult" ])
    end

    it "scrapes all the category urls" do
      category_urls = []
      # categories = scraper.scrape_categories_from_home_page
      @categories.each {|category| category_urls << category.url}

      expect(category_urls).to match_array(["https://www.goodreads.com/ebook-deals/today-only-book-deals",
                                             "https://www.goodreads.com/ebook-deals/bestsellers-book-deals",
                                             "https://www.goodreads.com/ebook-deals/romance-book-deals",
                                             "https://www.goodreads.com/ebook-deals/mystery-thrillers-book-deals",
                                             "https://www.goodreads.com/ebook-deals/fantasy-science-fiction-book-deals",
                                             "https://www.goodreads.com/ebook-deals/fiction-book-deals",
                                             "https://www.goodreads.com/ebook-deals/nonfiction-book-deals",
                                              "https://www.goodreads.com/ebook-deals/young-adult-book-deals"])
    end
  end

  describe "scrape_deals_from_category_page" do
    before do
      @category = BookDeals::Category.new("Bestsellers", "https://www.goodreads.com/ebook-deals/bestsellers-book-deals" )
      @selected_category = scraper.scrape_deals_from_category_page(@category)

    end

    it "scrapes all book deals from the category requested" do
      expect(@selected_category.books.count).to eql(12)
    end

    it "scrapes all books from category url" do
      book_titles = []
      @selected_category.books.each {|book| book_titles << book.title}
      puts book_titles
      expect(book_titles).to match_array(["Six of Crows (Six of Crows, #1)",
                                         "Disclosure",
                                         "Big Stone Gap (Big Stone Gap, #1)",
                                         "Beneath a Scarlet Sky",
                                         "A Land More Kind Than Home",
                                         "Becoming Nicole: The Transformation of an American Family",
                                         "Shadowshaper",
                                         "Ride the Wind",
                                         "All That Is Bitter And Sweet: A Memoir",
                                         "For the Thrill of It",
                                         "Blindspot: Hidden Biases of Good People",
                                         "Battle for Atlantis (Atlantis, #6)"])
    end
  end
end
