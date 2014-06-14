module Mjweb
  class Detail < ActiveRecord::Base
    has_many :services
    has_many :settings
    
    accepts_nested_attributes_for :services
    
  end
end
