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
      when 0, 3, 6, 9, 12 ; colour_ref = 0
      when 1, 4, 7, 10, 13 ; colour_ref = 1
      when 2, 5, 8, 11, 14 ; colour_ref = 2      
      end
      
            
      case content.tile.partial_name
        when "transparent_tile" ; render partial: "web_empty_tile"
        when "colour_tile" ; render partial: "web_colour_tile", locals: { colour_ref: colour_ref }
        when "contact" ; render_contact(content, colour_ref)
        when "map" ; render_map(content)
        when "hours" ; render_hours(content, colour_ref)    
        when "image" ; render_image(content, colour_ref)
        when "images" ; render_images(content, colour_ref)
        when "services" ; render_services(content, colour_ref) 
        when "services_link" ; render_services_link(colour_settings, colour_ref) 
        when "about" ; render_abouts_link(colour_settings, colour_ref)     
        when "ecommerce" ; render_ecommerce(content, colour_settings, colour_ref)
      end
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

    def render_image(content, colour_ref)
      #doing as one query does not works with PG and namespaces for some reason              
      set_image = Mjweb::Imagesetting.where(:content_id => content.id).first
      image = Mjweb::Image.where(:id => set_image.id).first
      
      return render partial: "web_image_tile", locals: { image: image }      
    end

    def render_images(content, colour_ref)
      #doing as one query does not works with PG and namespaces for some reason              
      image_ids = Mjweb::Imagesetting.where(:content_id => content.id).pluck(:image_id)
      images = Mjweb::Image.where(:id => image_ids)
      
      return render partial: "web_images_tile", locals: { images: images }      
    end

    def render_services(content, colour_ref)        
      services = Mjweb::Service.where(:company_id => content.company_id).order('id') 
      
      return render partial: "web_services_tile", locals: { services: services, colour_ref: colour_ref }      
    end

    def render_services_link(colour_settings, colour_ref)
      return render partial: "web_services_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }     
    end

    def render_abouts_link(colour_settings, colour_ref)
      return render partial: "web_about_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end
    
    def render_ecommerce(content, colour_settings, colour_ref)
      return render partial: "web_ecommerce_tile", locals: { content: content, colour_settings: colour_settings, colour_ref: colour_ref}      
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

 
    def font_style_colour(font)
      case font
        when 'Ek Mukta' ; "font-family: 'Ek Mukta', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe                                        
        when 'Marck Script' ; "font-family: 'Marck Script', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
      end      
    end 
   
  end
end