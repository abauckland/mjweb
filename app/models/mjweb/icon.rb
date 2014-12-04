module Mjweb
  class Icon < ActiveRecord::Base 

    has_many :linktiles#, inverse_of: :icon   
    
    mount_uploader :icon, Mjweb::IconUploader

    validates :name, :icon,
      presence: true,
      uniqueness: { case_sensitive: false }    

       
  end
end
