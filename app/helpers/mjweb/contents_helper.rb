module Mjweb
  module ContentsHelper
    
    def edit_links(content)

      case content.tile_id
        when 1 ; return # transparent
        when 2 ; return # colour tile
        when 3 ; link_to '', imagesetting_path(content.id), class: 'line_edit_icon', title: "edit image"
        when 4 ; link_to '', list_imagesetting_path(content.id), class: 'line_edit_icon', title: "edit images"
        when 5 ; return #location map 
        when 6 ; return #contact
        when 7 ; link_to '', edit_hour_path(current_user.id), class: 'line_edit_icon', title: "edit opening hours"
        when 8 ; return #events          
        when 9 ; return #plans
        when 10 ; return #e-commerce
        when 11 ; link_to '', edit_linktile_path(:id => content.id), class: 'line_edit_icon', title: "edit tile content/link"
      end  
    end

    def custom_title(content)
      linktile = Linktile.where(:content_id => content.id).first
      if linktile
        return linktile.title
      end
    end
    
  end
end