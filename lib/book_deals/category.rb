module BookDeals
  class Category
    attr_accessor :name, :url, :books

    def initialize
      self.books = []
    end
  end
end
