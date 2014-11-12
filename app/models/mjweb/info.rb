module Mjweb
  class Info < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :page

    validates :title, :text, :image_id, presence: true
        
  end
end
