module Mjweb
  class Content < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    
    #relationships with models in same engine
    has_many :imagesettings, dependent: :destroy
    has_many :images, :through => :imagesettings
    belongs_to :tile
    has_one :linktile, dependent: :destroy
    
  end
end
