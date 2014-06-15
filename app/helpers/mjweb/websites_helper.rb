module Mjweb
  module WebsitesHelper
  
    def display_web_tiles(content, detail)      
      case content.tile.partial_name
        when "transparent_tile" ; render partial: "web_empty_tile"
        when "colour_tile" ; render partial: "web_colour_tile"
        when "services" ; render_services(content, detail)  
        when "contact" ; render_contact(content, detail) 
        when "contact" ; render_images(content, detail)
      end
    end
    
    def render_services(content, detail)        
      services = Mjweb::Service.where(:company_id => detail.company_id).order('id') 
      
      return render partial: "web_services_tile", locals: { services: services }      
    end

    def render_contact(content, detail)        
      company = ::Company.where(:id => detail.company_id).first
      
      return render partial: "web_contact_tile", locals: { company: company }      
    end      

    def render_images(content, detail)              
      images = Mjweb::Images.joins(:contentimages => :content).where(:company_id => detail.company_id, 'content.id' => content.id)
      
      return render partial: "web_images_tile", locals: { images: images }      
    end

  
  end
end