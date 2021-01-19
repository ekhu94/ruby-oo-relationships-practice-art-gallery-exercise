class Artist

  @@all = []

  def self.all
    @@all
  end

  def self.total_experience
    self.all.reduce { |sum, artist| sum.years_experience + artist.years_experience }
  end

  def self.most_prolific
    self.all.reduce do |max, val|
      if max.paintings.length / max.years_experience.to_f > val.paintings.length / val.years_experience.to_f
        max
      else
        val
      end
    end
  end

  attr_reader :name, :years_experience

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    save
  end

  def save
    self.class.all << self
  end

  def create_painting(title, price, gallery)
    painting = Painting.new(title, price)
    painting.gallery = gallery
    painting.artist = self
  end

  def paintings
    Painting.all.select { |painting| painting.artist == self }
  end

  def galleries
    self.paintings.map { |painting| painting.gallery }
  end

  def cities
    self.galleries.map { |gallery| gallery.city }.uniq
  end

end
