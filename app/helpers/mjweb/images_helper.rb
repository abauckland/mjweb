module Mjweb
  module ImagesHelper
  
    def image_used(image)
      image_used = Imagesetting.where(:image_id => image.id).first
      if image_used.blank?
        return false
      else  
        return true
      end
    end
  
  
  end
end