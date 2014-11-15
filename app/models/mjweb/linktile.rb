module Mjweb
  class Linktile < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :content

    belongs_to :icon
    belongs_to :page    

    has_many :tilelists, dependent: :destroy
      
    accepts_nested_attributes_for :tilelists,                                 
                                  :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } },
                                  :allow_destroy => true

    validates :content_id, presence: true
    
  end
end
