module Mjweb
  class Page < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    belongs_to :icon
    
    has_many :infos, dependent: :destroy#, inverse_of: :page
    has_many :linktiles
    
    has_many :link_pages, :class_name => "Page", :foreign_key => "link_page_id"

    validates :name, presence: true
    
  end
end
