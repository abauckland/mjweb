module Mjweb
  class Font < ActiveRecord::Base
    has_many :designs#, inverse_of: :font
    mount_uploader :font, Mjweb::FontUploader

  validates :name, :style, :font,
    presence: true,
    uniqueness: { case_sensitive: false }    
    
  end
end
