module Mjweb
  class Networking < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    
    #relationships with models in same engine
    belongs_to :image  
  end
end
