module Mjweb
  class Tilelist < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :linktile

    validates :text, presence: true

  end
end
