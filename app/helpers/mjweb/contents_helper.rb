module Mjweb
  module ContentsHelper
    
    def edit_links(content)

      case content.tile_id
      when 1 ; link_to '', banks_path, class: 'line_edit_icon', title: "edit credit union information"
        when 2 ; link_to '', books_path, class: 'line_edit_icon', title: "edit book keeping information"
        when 3 ; link_to '', webpages_path, class: 'line_edit_icon', title: "edit website information"
        when 4 ; link_to '', networkings_path, class: 'line_edit_icon', title: "edit networking information"
        when 5 ; link_to '', mentorings_path, class: 'line_edit_icon', title: "edit mentoring information"
        when 6 ; link_to '', trainings_path, class: 'line_edit_icon', title: "edit training information"
        when 7 ; return #events 
        when 8 ; return #plans 
          
        when 9 ; return # transparent
        when 10 ; return #colour tile
        when 11 ; return #contact
        when 12 ; return #location map 
        when 13 ; link_to '', edit_hour_path(current_user.id), class: 'line_edit_icon', title: "edit opening hours information"
        when 14 ; link_to '', imagesetting_path(content.id), class: 'line_edit_icon', title: "edit image"
        when 15 ; link_to '', list_imagesetting_path(content.id), class: 'line_edit_icon', title: "edit images"
        when 16 ; link_to '', services_path, class: 'line_edit_icon', title: "edit service information"
        when 17 ; link_to '', services_path, class: 'line_edit_icon', title: "edit service information"
        when 18 ; link_to '', products_path, class: 'line_edit_icon', title: "edit product information"
        when 19 ; link_to '', products_path, class: 'line_edit_icon', title: "edit product information"
        when 20 ; link_to '', abouts_path, class: 'line_edit_icon', title: "edit about page"

        when 21 ; return #e-commerce 
      end  
    end
    
  end
end