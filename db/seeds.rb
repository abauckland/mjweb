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
Myjweb::Tiles.create(:name => "Ecommerce Link", :partial_name => 'ecommerce')
Myjweb::Tiles.create(:name => "Trading Hours", :partial_name => 'hours')


Myjweb::Details.create(:monday => "9.00am - 5.30pm",
                       :tuesday => "9.00am - 5.30pm",
                       :wednesday => "9.00am - 5.30pm",
                       :thursday => "9.00am - 5.30pm",
                       :friday => "9.00am - 5.30pm",
                       :saturday => "9.00am - 5.30pm",
                       :sunday => "11.00am - 4.30pm")
