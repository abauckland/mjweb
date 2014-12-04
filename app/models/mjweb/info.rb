module Mjweb
  class Info < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :page
    belongs_to :image
    
    belongs_to :link_page, :class_name => "Page"

    validates :title, :text, :image, presence: true
        
  end
end
