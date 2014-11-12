module Mjweb
  class Icon < ActiveRecord::Base 

    has_many :linktiles    
    
    mount_uploader :icon, Mjweb::IconUploader

    validates :name, :icon, presence: true
       
  end
end
