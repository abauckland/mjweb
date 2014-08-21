module Mjweb
  module ContentsHelper
    
    def edit_links(content)

      case content.tile_id
        when 1 ; link_to 'Edit Credit Union Information', banks_path, class: "btn btn-sm btn-primary btn"
        when 2 ; link_to 'Edit Book Keeping Information', books_path, class: "btn btn-sm btn-primary btn"
        when 3 ; link_to 'Edit Website Information', webpages_path, class: "btn btn-sm btn-primary btn"
        when 4 ; link_to 'Edit Networking Information', networkings_path, class: "btn btn-sm btn-primary btn"
        when 5 ; link_to 'Edit Mentoring Information', mentorings_path, class: "btn btn-sm btn-primary btn"
        when 6 ; link_to 'Edit Training Information', trainings_path, class: "btn btn-sm btn-primary btn"
        when 7 ; return #events 
        when 8 ; return #plans 
          
        when 9 ; return # transparent
        when 10 ; return #colour tile
        when 11 ; return #contact
        when 12 ; return #location map 
        when 13 ; link_to 'Edit Opening Hours Information', edit_hour_path(current_user.id), class: "btn btn-sm btn-primary btn"
        when 14 ; link_to 'Edit Image', imagesetting_path(content.id), class: "btn btn-sm btn-primary btn"
        when 15 ; link_to 'Edit Images', list_imagesetting_path(content.id), class: "btn btn-sm btn-primary btn"
        when 16 ; link_to 'Edit Service Information', services_path, class: "btn btn-sm btn-primary btn"
        when 17 ; link_to 'Edit Service Information', services_path, class: "btn btn-sm btn-primary btn"
        when 18 ; link_to 'Edit Product Information', products_path, class: "btn btn-sm btn-primary btn"
        when 19 ; link_to 'Edit Product Information', products_path, class: "btn btn-sm btn-primary btn"
        when 20 ; link_to 'Edit About Page', abouts_path, class: "btn btn-sm btn-primary btn"

        when 21 ; return #e-commerce 
      end  
    end
    
  end
end