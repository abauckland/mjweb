module Mjweb
  class Design < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
    belongs_to :background
    belongs_to :font
  end
end
