module Mjweb
  module ApplicationHelper

    def login_link
      if request.host == "www.myhq.org.uk"
        "<div class='login_container'>#{ link_to 'Log-in', main_app.new_user_session_path, class: 'login_link' }</div>".html_safe
      end
    end


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

 
    def font_style_colour(design)
      
      case design.font.name
        when 'Ek Mukta' ;       "font-family: 'Ek Mukta', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Marck Script' ;   "font-family: 'Marck Script', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Play' ;           "font-family: 'Play', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Questrial' ;      "font-family: 'Questrial', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Coming Soon' ;    "font-family: 'Coming Soon', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Crimson Text' ;   "font-family: 'Crimson Text', serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Libre Baskerville' ;  "font-family: 'Libre Baskerville', serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Nunito' ;         "font-family: 'Nunito', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Open Sans' ;      "font-family: 'Open Sans', sans-serif; font-size: 2.2rem; line-height: 2.4rem".html_safe
        when 'Pacifico' ;       "font-family: 'Pacifico', cursive; font-size: 2.2rem; line-height: 2.4rem".html_safe
      end
    end

  end
end
