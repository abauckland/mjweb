module Mjweb
  class Content < ActiveRecord::Base
    has_many :imagesettings
    has_many :images, :through => :imagesettings
    belongs_to :tile
    
  end
end
