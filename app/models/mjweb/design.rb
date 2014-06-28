module Mjweb
  class Design < ActiveRecord::Base
    #relationship with model in main app
    belongs_to :company
  end
end
