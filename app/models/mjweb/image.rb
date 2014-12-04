module Mjweb
  class Image < ActiveRecord::Base

    IMAGE_REGEXP = /\A[a-zA-Z0-9\W]+\z/ #any characters but no spaces

    #relationship with model in main app
    belongs_to :company
    mount_uploader :image, Mjweb::ImageUploader
    #relationships with models in same engine
    has_many :imagesettings#, inverse_of: :image
    has_many :infos#, inverse_of: :image

    validates :name, presence: true

    validates :image,
      presence: true,
      format: { with: IMAGE_REGEXP, message: "please enter an image that doe not contain any spaces" }

  end
end
