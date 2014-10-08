#require_dependency "mjweb/application_controller"
require 'colorist'
include Colorist

module Mjweb
  class WebsitesController < ApplicationController
    before_action :set_company
    before_action :set_detail
    before_action :set_design
    # GET /websites
    # GET /websites.json
    def index
      @contents = Mjweb::Content.where(:company_id => @sub_company.id).order('tile_ref')
      @design = Mjweb::Design.where(:company_id => @sub_company.id).first
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def about
      @contents = Mjweb::About.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"
    end

    def service
      @contents = Mjweb::Service.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def bank
      @contents = Mjweb::Bank.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def book
      @contents = Mjweb::Book.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def event
      @company = Company.where(:id => @sub_company.id).first
      @events = Mjweb::Event.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def networking
      @contents = Mjweb::Networking.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def product
      @contents = Mjweb::Product.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end    


    def training
      @contents = Mjweb::Training.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end  
    
    def webpage
      @contents = Mjweb::Webpage.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end
                      
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_website
       # @website = Website.find(params[:id])
      end

      def set_design
        set_company
        @design = Mjweb::Design.where(:company_id => @sub_company.id).first
      end

      def set_detail
        set_company
        @detail = Mjweb::Detail.where(:company_id =>  @sub_company.id).first
      end


      def set_company	 
        subdomain = request.subdomain(tld_length = 2)
        domain = request.domain(tld_length = 2)
      	
      	if domain == "myhq.org.uk"
        	if subdomain == 'www'
        		company = ::Company.find_by_sql(["SELECT * FROM companies WHERE id = ?", 1])
        	else
        		company = ::Company.find_by_sql(["SELECT * FROM companies WHERE subdomain = ?", subdomain])		
        	end
      	else
      	  company = ::Company.find_by_sql(["SELECT * FROM companies WHERE domain = ?", domain])  
      	end  

      	unless company.empty?
      		selected = company.first
      		company_id = selected[:id]
             	@sub_company = ::Company.find(company_id) 
      	else
      		@sub_company = ::Company.find(1) 
      	end            
      end

      
      def colour_settings(colour)

        @colour_settings = []
        tile_shades = ['standard', 'light', 'dark']
        
        tile_shades.each_with_index do |shade, i|

          case i
            when 0 ; x = 0
            when 1 ; x = 0.15
            when 2 ; x = 0.1
          end
          
          tile = colour.to_color + x.to_color
          tile_hover = tile + (x + 0.1).to_color
          
          text = tile.text_color
          text_hover = tile_hover.text_color
          
          tile_image = sprite_file(text)
          tile_image_hover = sprite_file(text_hover)
          
          background = tile.invert.to_grayscale
                    
          @colour_settings[i] = {:tile => tile, :tile_hover => tile_hover, :text => text, :text_hover => text_hover, :tile_image => tile_image, :tile_image_hover => tile_image_hover}                         
       end
      end

      
      def sprite_file(color)
        if color == '#ffffff'
          'white'
        else
          'black'          
       end        
      end
  
  end
end

