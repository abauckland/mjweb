# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Myjweb::Tile.create(:name => "Transparent Tile", :partial_name => 'transparent_tile')
Myjweb::Tile.create(:name => "Colour Tile", :partial_name => 'colour_tile')
Myjweb::Tile.create(:name => "Contact", :partial_name => 'contact')
Myjweb::Tile.create(:name => "Location Map", :partial_name => 'map')
Myjweb::Tile.create(:name => "Opening Hours", :partial_name => 'hours')
Myjweb::Tile.create(:name => "Image", :partial_name => 'image')
Myjweb::Tile.create(:name => "Multiple Images", :partial_name => 'images')
Myjweb::Tile.create(:name => "Services", :partial_name => 'services')
Myjweb::Tile.create(:name => "Services Link", :partial_name => 'services_link')
Myjweb::Tile.create(:name => "About Us Link", :partial_name => 'about')
Myjweb::Tile.create(:name => "E-commerce Link", :partial_name => 'ecommerce')

Myjweb::Background.create(:name => 'Textured Light Beige')
Myjweb::Background.create(:name => 'White Linen')

Myjweb::Font.create(:name => 'Ek Mukta')
Myjweb::Font.create(:name => 'Marck Script')
