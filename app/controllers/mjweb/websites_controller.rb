require_dependency "mjweb/application_controller"

require 'colorist'
include Colorist

module Mjweb
  class WebsitesController < ApplicationController
    #before_action :set_website, only: [:index]
  
    # GET /websites
    # GET /websites.json
    def index
      @detail = Mjweb::Detail.where(:subdomain_name => "test_subdomain").first
      
      @contents = Mjweb::Content.where(:company_id => @detail.company_id).order('id')

      colour_settings(@detail.tile_colour) 


    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_website
       # @website = Website.find(params[:id])
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
          
          tile_image = sprite_file(tile)
          tile_image_hover = sprite_file(tile_hover)
          
          background = tile.invert.to_grayscale
                    
          @colour_settings[i] = {:tile => tile, :tile_hover => tile_hover, :text => text, :text_hover => text_hover, :tile_image => tile_image, :tile_image_hover => tile_image_hover}
                         
       end
        @background_colour = colour.to_color.invert.to_grayscale
      end

      
      def sprite_file(color)
        if color == '#ffffff'
          "(/assets/mjweb/web_icons.png) 80px 0;"
        else
          "(/assets/mjweb/web_icons.png) 80px 0;"           
       end        
      end
  
  end
end

