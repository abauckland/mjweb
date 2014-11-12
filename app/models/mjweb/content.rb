module Mjweb
  class Content < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    
    #relationships with models in same engine
    has_many :imagesettings
    has_many :images, :through => :imagesettings
    belongs_to :tile
    has_one :linktile, dependent: :destroy

#    accepts_nested_attributes_for :linktile


#    after_create :create_nested_records    

#    def create_nested_records
#      if self.tile_id == 11 #id of custom tile
#        Mjweb::Linktile.create(:content_id => self.id)
#      end
#    end
    
    
  end
end
