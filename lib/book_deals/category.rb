module BookDeals
  class Category
    attr_accessor :name, :url, :books

    def add_book(book)
      self.books << book
      book.categories << self
    end
    
    def initialize(name)
      self.name = name
      self.books = []
    end
  end
end
