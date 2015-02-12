module Mjweb
  class Design < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    belongs_to :background
    belongs_to :font
       
    validates :background_id, :font_id, presence: true    
    validates :tile_colour,
      presence: true#,
#      format: { with: COLOUR_REGEXP, message: "please enter a vaild hex colour in the format #dddddd or #ddd" }
    
    
  end
end
