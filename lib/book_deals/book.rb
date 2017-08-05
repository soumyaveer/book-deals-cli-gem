module BookDeals
  class Book
    attr_accessor :title, :author, :description, :deal, :categories

    def initialize
      @categories = []
    end

    
  end
end
