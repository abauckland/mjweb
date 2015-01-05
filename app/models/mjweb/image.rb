module Mjweb
  class Image < ActiveRecord::Base

    #relationship with model in main app
    belongs_to :company
    mount_uploader :image, Mjweb::ImageUploader
    #relationships with models in same engine
    has_many :imagesettings#, inverse_of: :image
    has_many :infos#, inverse_of: :image

    validates :name,
      presence: true,
      format: { with: IMAGE_REGEXP, message: "please enter an image name that does not contain any spaces" }

  end
end
