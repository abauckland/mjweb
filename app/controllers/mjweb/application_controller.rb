
  class Mjweb::ApplicationController < ApplicationController
       layout "mjweb/layouts/admin"

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

        if company.empty?
          @sub_company = ::Company.find(1)
        else
          selected = company.first
          company_id = selected[:id]
          @sub_company = ::Company.find(company_id)
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
