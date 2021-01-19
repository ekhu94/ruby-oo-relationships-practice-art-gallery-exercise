require_relative '../config/environment.rb'

artist1 = Artist.new("michael", 5)
artist2 = Artist.new("george", 1)
gallery1 = Gallery.new("food gallery", "foodtown")
gallery2 = Gallery.new("water gallery", "watertown")
artist1.create_painting("pt1", 25, gallery1)
artist1.create_painting("pt2", 30, gallery2)
artist2.create_painting("pt3", 100, gallery2)
artist2.create_painting("pt4", 2000, gallery2)


binding.pry

puts "Bob Ross rules."
