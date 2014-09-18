module Mjweb
  module ApplicationHelper
    def set_background(design)     
       case design.background_id         
        when 1 ; "<div class='background_image_1'></div>".html_safe
        when 2 ; "<div class='background_image_2'></div>".html_safe                
       end  
    end  
  end
end
