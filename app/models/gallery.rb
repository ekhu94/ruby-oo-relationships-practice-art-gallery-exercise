class Gallery

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name, :city
  attr_accessor :artists

  def initialize(name, city)
    @name = name
    @city = city
    save
  end

  def save
    self.class.all << self
  end

  def paintings
    Painting.all.select { |painting| painting.gallery == self }
  end

  def artists
    paintings.map { |painting| painting.artist }.uniq
  end

  def artist_names
    artists.map { |artist| artist.name }
  end

  def most_expensive_painting
    paintings.reduce { |max, val| max.price > val.price ? max : val }
  end

end
