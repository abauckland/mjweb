module Mjweb
  module WebsitesHelper
  
    def display_web_tiles(content, detail, colour_ref)
      
      case colour_ref
      when 4 ; colour_ref = 1
      when 5 ; colour_ref = 2
      when 6 ; colour_ref = 3
      when 7 ; colour_ref = 1
      when 8 ; colour_ref = 2
      when 9 ; colour_ref = 3
      when 10 ; colour_ref = 1                                        
      end
      
            
      case content.tile.partial_name
        when "transparent_tile" ; render partial: "web_empty_tile"
        when "colour_tile" ; render partial: "web_colour_tile", locals: { colour_ref: colour_ref }
        when "services" ; render_services(content, detail, colour_ref)  
        when "contact" ; render_contact(content, detail, colour_ref)
        when "hours" ; render_hours(content, detail, colour_ref)    
        when "image" ; render_images(content, detail, colour_ref)
        when "ecommerce" ; render_ecommerce(content, detail, colour_ref)  
      end
    end
    
    def render_services(content, detail, colour_ref)        
      services = Mjweb::Service.where(:company_id => detail.company_id).order('id') 
      
      return render partial: "web_services_tile", locals: { services: services, colour_ref: colour_ref }      
    end

    def render_contact(content, detail, colour_ref)        
      company = ::Company.where(:id => detail.company_id).first
      
      return render partial: "web_contact_tile", locals: { company: company, colour_ref: colour_ref }      
    end      

    def render_hours(content, detail, colour_ref)              
      return render partial: "web_hours_tile", locals: { detail: detail, colour_ref: colour_ref }      
    end 


    def render_images(content, detail, colour_ref)              
      images = Mjweb::Images.joins(:contentimages => :content).where(:company_id => detail.company_id, 'content.id' => content.id)
      
      return render partial: "web_images_tile", locals: { images: images }      
    end

    def render_ecommerce(content, detail, colour_ref)                    
      return render partial: "web_link_tile", locals: { content: content, colour_ref: colour_ref}      
    end
    
    
    def tile_link_image(image_ref, y)
      
      icon_image = "background: url('/assets/mjweb/web_icons.png')"
       
      if image_ref == 'white' 
        "<style>.image{#{icon_image} 0px #{y.to_s}px; }.image:hover{#{icon_image} 200px #{y.to_s}px; }</style>".html_safe  
      else 
        "<style>.image{#{icon_image} 200px #{y.to_s}px; }.image:hover{#{icon_image} 0px #{y.to_s}px; }</style>".html_safe
      end
  
    end
  
  
    
    
  
  end
end