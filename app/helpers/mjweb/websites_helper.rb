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
      when 0 ; colour_ref = 1
      when 1 ; colour_ref = 2
      when 2 ; colour_ref = 3
      when 3 ; colour_ref = 1
      when 4 ; colour_ref = 2
      when 5 ; colour_ref = 3
      when 6 ; colour_ref = 1
      when 7 ; colour_ref = 2
      when 8 ; colour_ref = 3
      when 9 ; colour_ref = 1
      when 10 ; colour_ref = 2                                        
      end
      
            
      case content.tile.partial_name
        when "transparent_tile" ; render partial: "web_empty_tile"
        when "colour_tile" ; render partial: "web_colour_tile", locals: { colour_ref: colour_ref }
        when "services" ; render_services(content, colour_ref)  
        when "contact" ; render_contact(content, colour_ref)
        when "hours" ; render_hours(content, colour_ref)    
        when "image" ; render_images(content, colour_ref)
        when "ecommerce" ; render_ecommerce(content, colour_settings, colour_ref)
        when "map" ; render_map(content)    
      end
    end
    
    def render_map(content)        
      company = ::Company.where(:id => content.company_id).first 
      
      return render partial: "web_map_tile", locals: { company: company }      
    end


    def render_services(content, colour_ref)        
      services = Mjweb::Service.where(:company_id => content.company_id).order('id') 
      
      return render partial: "web_services_tile", locals: { services: services, colour_ref: colour_ref }      
    end

    def render_contact(content, colour_ref)        
      company = ::Company.where(:id => content.company_id).first
      
      return render partial: "web_contact_tile", locals: { company: company, colour_ref: colour_ref }      
    end      

    def render_hours(content, colour_ref)
      hours = Mjweb::Hour.where(:company_id => content.company_id).first  
                    
      return render partial: "web_hours_tile", locals: { hours: hours, colour_ref: colour_ref }      
    end 


    def render_images(content, colour_ref)
      #doing as one query does not works with PG and namespaces for some reason              
      image_ids = Mjweb::Imagesetting.where(:content_id => content.id).pluck(:image_id)
      images = Mjweb::Image.where(:id => image_ids)
      
      return render partial: "web_images_tile", locals: { images: images }      
    end

    def render_ecommerce(content, colour_settings, colour_ref)                    
      return render partial: "web_ecommerce_tile", locals: { content: content, colour_settings: colour_settings, colour_ref: colour_ref}      
    end


    def tile_link_icon(colour_settings, colour_ref, y)

      icon_image = "background: url('/assets/mjweb/web_icons.png')"

      if colour_settings[colour_ref][:tile_image] == 'white'
        if colour_settings[colour_ref][:tile_image_hover] == 'white'
          "<style> .image{#{icon_image} 0px #{y.to_s}px} .image:hover{#{icon_image} 0px #{y.to_s}px}</style>".html_safe 
        else
          "<style> .image{#{icon_image} 0px #{y.to_s}px} .image:hover{#{icon_image} 0px #{y.to_s}px}</style>".html_safe
        end
      else
        if colour_settings[colour_ref][:tile_image_hover] == 'white'
          "<style> .image{#{icon_image} 200px #{y.to_s}px} .image:hover{#{icon_image} 0px #{y.to_s}px}</style>".html_safe 
        else
          "<style> .image{#{icon_image} 200px #{y.to_s}px} .image:hover{#{icon_image} 200px #{y.to_s}px}</style>".html_safe
        end
      end

    end

  
    def font_style_colour(font)
      case font
        when 'Marck Script' ; "font-family: 'Marck Script', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe                                        
        when 'Marck Script' ; "font-family: 'Marck Script', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
      end      
    end 

  end
end