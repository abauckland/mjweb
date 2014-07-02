module Mjweb
  class Font < ActiveRecord::Base
    has_many :designs
  end
end
