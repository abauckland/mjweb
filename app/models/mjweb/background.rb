module Mjweb
  class Background < ActiveRecord::Base
    has_many :designs
  end
end
