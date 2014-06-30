module Mjweb
  class Image < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    mount_uploader :image, Mjweb::ImageUploader
    #relationships with models in same engine
    has_many :imagesettings, :class_name => "Mjweb::Imagesetting"
    has_many :abouts



  end
end
