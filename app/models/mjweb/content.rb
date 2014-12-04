module Mjweb
  class Content < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    
    #relationships with models in same engine
    has_many :imagesettings, dependent: :destroy#, inverse_of: :content
    has_many :images, :through => :imagesettings

    belongs_to :tile

    has_one :linktile, dependent: :destroy#, inverse_of: :content


#  validates :tile, :tile_ref, :display,
#    presence: true    
    
  end
end
