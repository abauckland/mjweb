module Mjweb
  module WebsitesHelper
  
    def content_display(content, colour_settings, i)
      case content[:display]
      when 'All devices'; "<div class='all_devices'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      when 'Desktops & Tablets'; "<div class='tablets'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      when 'Desktops only'; "<div class='desktops'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      end
    end
    
    
    def display_web_tiles(content, colour_settings, colour_ref)
      
      case colour_ref
      when 0, 4, 8, 10, 12, 15 ; colour_ref = 0
      when 1, 5, 7, 9, 13, 16 ; colour_ref = 1
      when 2, 3, 6, 11, 14, 17 ; colour_ref = 2
      end
      
            
      case content.tile.partial_name
        when "transparent" ; render partial: "web_empty_tile"
        when "colour" ; render partial: "web_colour_tile", locals: { colour_ref: colour_ref }
        when "contact" ; render_contact(content, colour_ref)
        when "map" ; render_map(content)
        when "hours" ; render_hours(content, colour_ref)
        when "image" ; render_image(content)
        when "images" ; render_images(content)

        when "ecommerce" ; render_ecommerce(content, colour_settings, colour_ref)

        when "events_link" ; render_events_link(content, colour_settings, colour_ref) 
        when "plans_link'" ; render_plans_link(content, colour_ref)
        when "custom" ; render_custom_tile(content, colour_settings, colour_ref)
      end
    end

    def render_custom_tile(content, colour_settings, colour_ref)    
      return render partial: "web_custom_tile", locals: { content: content, colour_settings: colour_settings, colour_ref: colour_ref }     
    end  


    def render_contact(content, colour_ref)
      company = ::Company.where(:id => content.company_id).first
      
      return render partial: "web_contact_tile", locals: { company: company, colour_ref: colour_ref }
    end

    def render_map(content)
      company = ::Company.where(:id => content.company_id).first
      
      return render partial: "web_map_tile", locals: { company: company }
    end

    def render_hours(content, colour_ref)
      hours = Mjweb::Hour.where(:company_id => content.company_id).first
                    
      return render partial: "web_hours_tile", locals: { hours: hours, colour_ref: colour_ref }
    end

    def render_image(content)
      #doing as one query does not works with PG and namespaces for some reason  
      set_image = Mjweb::Imagesetting.where(:content_id => content.id).first
      
    	if set_image
    	 image = Mjweb::Image.where(:id => set_image.image_id).first
          
    	 return render partial: "web_image_tile", locals: { image: image }
    	end
    end

    def render_images(content)
      #doing as one query does not works with PG and namespaces for some reason              
      image_ids = Mjweb::Imagesetting.where(:content_id => content.id).pluck(:image_id)

	    if image_ids
	     images = Mjweb::Image.where(:id => image_ids)
      
      	return render partial: "web_images_tile", locals: { images: images }
	    end
    end

    def render_events_link(content, colour_settings, colour_ref)
      events = Mjweb::Event.where(:company_id => content.company_id).order('id')
      
      return render partial: "web_events_tile", locals: { events: events, colour_settings: colour_settings, colour_ref: colour_ref }    
    end
    
    def render_plans_link(content, colour_ref)
      plans = Mjweb::Plan.where(:company_id => content.company_id).order('id')
      
      return render partial: "web_plans_tile", locals: { plans: plans, colour_ref: colour_ref }
    end 
    
    def  link_icon(colour_settings, colour_ref)
      if colour_settings[colour_ref][:tile_image] == 'white'
        if colour_settings[colour_ref][:tile_image_hover] == 'white'
          'white'
        else
          'white_black'
        end
      else
        if colour_settings[colour_ref][:tile_image_hover] == 'white'
          'black_white'
        else
          'black'
        end
      end
    end


   
  end
end