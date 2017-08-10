module BookDeals
  # current deal on the book

  class Deal
    attr_accessor :price, :original_price, :expires_in

    def initialize(price, original_price = nil, expires_in = nil)
      self.price = price
      self.original_price = original_price
      self.expires_in = expires_in
    end
  end
end
