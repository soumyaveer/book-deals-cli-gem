module BookDeals
  class Category
    attr_accessor :name, :url, :books

    def initialize
      self.books = []
    end

    def add_book(book)
      self.books << book
      book.categories << self
    end
  end
end
