module BookDeals
  class Book
    attr_accessor :title, :author, :description, :deal, :categories

    def initialize(deal = Deal.new)
      self.categories = []
      self.deal = deal
    end
  end
end
