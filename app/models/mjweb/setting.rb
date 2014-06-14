module Mjweb
  class Setting < ActiveRecord::Base
    has_many :imagesettings
    has_many :images, :through => :imagesettings
    has_many :tiles
    belongs_to :details
    
    accepts_nested_attributes_for :imagesettings
    
  end
end
