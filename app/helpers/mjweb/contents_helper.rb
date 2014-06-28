module Mjweb
  module ContentsHelper
    
    def edit_links(content)

      case content.tile_id
        when 1 ; return
        when 2 ; return
        when 3 ; link_to 'Edit Service Information', services_path, class: "btn btn-sm btn-primary btn"
        when 4 ; link_to 'Edit Images', imagesettings_path(content.id), class: "btn btn-sm btn-primary btn"
        when 5 ; link_to 'Edit About Page', abouts_path, class: "btn btn-sm btn-primary btn"
        when 6 ; link_to 'Edit Opening Hours Information', edit_hour_path(current_user.id), class: "btn btn-sm btn-primary btn"
      end  
    end
    
  end
end
