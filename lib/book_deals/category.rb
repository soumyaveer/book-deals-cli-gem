module BookDeals
  # category is a collection of books

  class Category
    attr_accessor :name, :url, :books

    def add_book(book)
      self.books << book
      book.categories << self
    end

    def initialize(name, url)
      self.name = name
      self.url = url
      self.books = []
    end
  end
end
