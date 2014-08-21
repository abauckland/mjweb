module Mjweb
  class Image < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    mount_uploader :image, Mjweb::ImageUploader
    #relationships with models in same engine
    has_many :imagesettings, :class_name => "Mjweb::Imagesetting"
    has_many :abouts
    has_many :services
    has_many :books
    has_many :banks
    has_many :networkings
    has_many :products    
    has_many :trainings 
    has_many :webpages  

  end
end
