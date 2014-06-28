module Mjweb
  class Detail < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company

    #relationships with models in same engine
    has_many :services
    
    accepts_nested_attributes_for :services
    
  end
end
