module BookDeals
  # book on the deal

  class Book
    attr_accessor :title, :author, :description, :deal, :purchase_url, :categories

    def initialize(deal, title, author, purchase_url, description = nil)
      self.title = title
      self.author = author
      self.purchase_url = purchase_url
      self.description = description
      self.categories = []
      self.deal = deal
    end

    def to_s
      <<-DETAILS.gsub /^ */, ''
      #{"Book Title:".colorize(:yellow)} #{self.title} \n
      #{"Author:".colorize(:yellow)}  #{self.author} \n
      #{"Description:".colorize(:yellow)} #{self.description} \n
      #{"Deal Price:".colorize(:yellow)} #{self.deal.price} \n
      #{"Original Price:".colorize(:yellow)} #{self.deal.original_price} \n
      #{"Expires in:".colorize(:yellow)} #{self.deal.expires_in} \n
      #{"This book can be purchased on:".colorize(:yellow)} #{self.purchase_url.colorize(:magenta)} \n
      ==============================================================================
      DETAILS
    end
  end
end
