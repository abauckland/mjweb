module Mjweb
  class Background < ActiveRecord::Base
    has_many :designs
    mount_uploader :background, Mjweb::ImageUploader
  end
end
