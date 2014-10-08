module Mjweb
  module WebsitesHelper
  
      def set_background(design)     
       case design.background_id         
        when 1 ; "<div class='background_image_1'></div>".html_safe
        when 2 ; "<div class='background_image_2'></div>".html_safe                
        when 3 ; "<div class='background_image_3'></div>".html_safe
        when 4 ; "<div class='background_image_4'></div>".html_safe
        when 5 ; "<div class='background_image_5'></div>".html_safe
        when 6 ; "<div class='background_image_6'></div>".html_safe
       end  
    end  
  
  
    def content_display(content, colour_settings, i)
      case content[:display]
      when 'All devices'; "<div class='all_devices'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      when 'Desktops & Tablets'; "<div class='tablets'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      when 'Desktops only'; "<div class='desktops'>#{display_web_tiles(content, colour_settings, i)}</div>".html_safe
      end  
    end
    
    
    def display_web_tiles(content, colour_settings, colour_ref)
      
      case colour_ref
      when 0, 3, 6, 9, 12, 15 ; colour_ref = 0
      when 1, 4, 7, 10, 13, 16 ; colour_ref = 1
      when 2, 5, 8, 11, 14, 17 ; colour_ref = 2      
      end
      
            
      case content.tile.partial_name
        when "transparent_tile" ; render partial: "web_empty_tile"
        when "colour_tile" ; render partial: "web_colour_tile", locals: { colour_ref: colour_ref }
        when "contact" ; render_contact(content, colour_ref)
        when "map" ; render_map(content)
        when "hours" ; render_hours(content, colour_ref)    
        when "image" ; render_image(content)
        when "images" ; render_images(content)
        when "services" ; render_services(content, colour_ref) 
        when "services_link" ; render_services_link(colour_settings, colour_ref) 
        when "about" ; render_abouts_link(colour_settings, colour_ref)     
        when "ecommerce" ; render_ecommerce(content, colour_settings, colour_ref)
        when "products" ; render_services(content, colour_ref)
        when "products_link" ; render_products_link(colour_settings, colour_ref) 
        when "credit_union_link" ; render_banks_link(colour_settings, colour_ref)
        when "books_link" ; render_books_link(colour_settings, colour_ref)            
        when "webpages_link" ; render_webpages_link(colour_settings, colour_ref) 
        when "networking_link" ; render_networkings_link(colour_settings, colour_ref)   
        when "mentoring_link" ; render_mentorings_link(colour_settings, colour_ref) 
        when "training_link" ; render_trainings_link(colour_settings, colour_ref) 
        when "events_link" ; render_events_link(content, colour_settings, colour_ref)          
        when "plans_link'" ; render_plans_link(content, colour_ref)
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


    def render_products(content, colour_ref)        
      products = Mjweb::Product.where(:company_id => content.company_id).order('id') 
      
      return render partial: "web_products_tile", locals: { products: products, colour_ref: colour_ref }      
    end

    def render_products_link(colour_settings, colour_ref)
      return render partial: "web_products_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end

    def render_banks_link(colour_settings, colour_ref)
      return render partial: "web_banks_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end

    def render_books_link(colour_settings, colour_ref)
      return render partial: "web_books_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end

    def render_networkings_link(colour_settings, colour_ref)
      return render partial: "web_networkings_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end
    
    def render_trainings_link(colour_settings, colour_ref)
      return render partial: "web_trainings_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
    end    

    def render_webpages_link(colour_settings, colour_ref)
      return render partial: "web_webpages_link_tile", locals: { colour_settings: colour_settings, colour_ref: colour_ref }      
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

 
    def font_style_colour(design)
      
        if design.font_id == 1 
          return "font-family: 'Ek Mukta', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        end
        if design.font_id == 2 
          return "font-family: 'Marck Script', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
        end        
        if design.font_id == 3 
          return "font-family: 'Play', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        end                                                
        if design.font_id == 4 
          return "font-family: 'Questrial', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
        if design.font_id == 5 
          return "font-family: 'Coming Soon', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
        if design.font_id == 6 
          return "font-family: 'Crimson Text', serif; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
        if design.font_id == 7 
          return "font-family: 'Libre Baskerville', serif; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
        if design.font_id == 8 
          return "font-family: 'Nunito', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe e
        end
        if design.font_id == 8 
          return "font-family: 'Open Sans', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
        if design.font_id == 10 
          return "font-family: 'Pacifico', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe 
        end
    
    end 
   
  end
end