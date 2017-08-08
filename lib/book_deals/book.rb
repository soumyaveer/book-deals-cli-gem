module BookDeals
  class Book
    attr_accessor :title, :author, :description, :deal, :categories

    def initialize(deal, title, author, description = nil)
      self.title = title
      self.author = author
      self.description = description
      self.categories = []
      self.deal = deal
    end
  end
end
