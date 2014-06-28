module Mjweb
  class Content < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    
    #relationships with models in same engine
    has_many :imagesettings
    has_many :images, :through => :imagesettings
    belongs_to :tile
    
  end
end
