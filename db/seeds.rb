# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Myjweb::Tiles.create(:name => "Transparent Tile", :partial_name => 'transparent_tile')
Myjweb::Tiles.create(:name => "Colour Tile", :partial_name => 'colour_tile')
Myjweb::Tiles.create(:name => "Services", :partial_name => 'services')
Myjweb::Tiles.create(:name => "Contact", :partial_name => 'contact')
Myjweb::Tiles.create(:name => "Image", :partial_name => 'image_tile')
Myjweb::Tiles.create(:name => "Multiple Images", :partial_name => 'multi_image_tile')
Myjweb::Tiles.create(:name => "Ecommerce Link", :partial_name => 'ecommerce')