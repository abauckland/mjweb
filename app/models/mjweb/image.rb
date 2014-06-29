module Mjweb
  class Image < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company

    #relationships with models in same engine
    has_many :imagesettings, :class_name => "Mjweb::Imagesetting"
    has_many :abouts

    has_attached_file :photo, :styles => { :tile => "200x200>", :thumb => "100x100>" } 
  
  #  validates_attachment_content_type :photo, content_type: { content_type: ["image/jpg", "image/png"]}
  
    validates_attachment :photo,
      :on => :create,
      :size => { :in => 0..1000.kilobytes }


    Paperclip.interpolates :normalized_video_file_name do |attachment, style|
      attachment.instance.normalized_image_file_name
    end

    def normalized_video_file_name
      "#{self.id}-#{self.video_image_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}"
    end

  end
end
