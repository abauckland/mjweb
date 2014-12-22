# encoding: utf-8
module Mjweb
  class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.company.name}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
    
  process :resize_to_fill => [200, 200]
  process :auto_orient  

  version :thumb do
    process :resize_to_fill => [50, 50]
    process :auto_orient
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
      img
    end
  end

   def extension_white_list
     %w(jpg jpeg gif png)
   end

  end
end