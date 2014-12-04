module Mjweb
  class Background < ActiveRecord::Base
    has_many :designs#, inverse_of: :background
    mount_uploader :background, Mjweb::BackgroundUploader

  validates :name, :background,
    presence: true,
    uniqueness: { case_sensitive: false }
    
  end
end
