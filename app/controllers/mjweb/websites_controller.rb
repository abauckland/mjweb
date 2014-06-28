require_dependency "mjweb/application_controller"

require 'colorist'
include Colorist

module Mjweb
  class WebsitesController < ApplicationController
    before_action :set_company, only: [:index, :about, :service]
  
    # GET /websites
    # GET /websites.json
    def index
      @detail = Mjweb::Detail.where(:company_id =>  @sub_company.id).first      
      @contents = Mjweb::Content.where(:company_id =>  @sub_company.id).order('updated_at DESC')
      @design = Mjweb::Design.where(:company_id =>  @sub_company.id).first
      colour_settings(@design.tile_colour) 
    end

    def about
      @contents = Mjweb::About.where(:company_id => @sub_company.id).order('id')
    end

    def service
      @contents = Mjweb::Service.where(:company_id => @sub_company.id).order('id')
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_website
       # @website = Website.find(params[:id])
      end

      def set_company             
      # if request.subdomain == www
      #sub_company = ::Company.find_by subdomain: request.subdomain
      # else
      #sub_company = ::Company.find_by subdomain: request.subdomain  
      # end  
        @sub_company = ::Company.first      
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

