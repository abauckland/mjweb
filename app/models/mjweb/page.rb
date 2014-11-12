module Mjweb
  class Page < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    belongs_to :icon
    
    has_many :infos, dependent: :destroy
    has_many :linktiles

    validates :name, presence: true
    
  end
end
