class Painting

  @@all = []

  def self.all
    @@all
  end

  def self.prices
    self.all.map { |painting| painting.price }
  end

  def self.total_price
    self.prices.reduce { |sum, val| sum + val }
  end

  attr_reader :title, :price
  attr_accessor :gallery, :artist

  def initialize(title, price)
    @title = title
    @price = price
    save
  end

  def save
    self.class.all << self
  end

end
