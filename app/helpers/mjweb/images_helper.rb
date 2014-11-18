module Mjweb
  module ImagesHelper
  
    def image_used(image)
      image_used_tile = Imagesetting.where(:image_id => image.id).first
      image_used_info = Info.where(:image_id => image.id).first
      if image_used_tile.blank? && image_used_info.blank? 
        return false
      else  
        return true
      end
    end
  
  
  end
end