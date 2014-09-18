module Mjweb
  class Font < ActiveRecord::Base
    has_many :designs
    mount_uploader :font, Mjweb::ImageUploader
  end
end
