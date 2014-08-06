module Mjweb
  module ContentsHelper
    
    def edit_links(content)

      case content.tile_id
        when 1 ; return # transparent
        when 2 ; return #colour tile
        when 3 ; return #contact
        when 4 ; return #location map 
        when 5 ; link_to 'Edit Opening Hours Information', edit_hour_path(current_user.id), class: "btn btn-sm btn-primary btn"
        when 6 ; link_to 'Edit Image', imagesetting_path(content.id), class: "btn btn-sm btn-primary btn"
        when 7 ; link_to 'Edit Images', list_imagesetting_path(content.id), class: "btn btn-sm btn-primary btn"
        when 8 ; link_to 'Edit Service Information', services_path, class: "btn btn-sm btn-primary btn"
        when 9 ; link_to 'Edit Service Information', services_path, class: "btn btn-sm btn-primary btn"
        when 10 ; link_to 'Edit About Page', abouts_path, class: "btn btn-sm btn-primary btn"
        when 11 ; return #e-commerce   
      end  
    end
    
  end
end
