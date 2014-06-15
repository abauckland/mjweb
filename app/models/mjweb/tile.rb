module Mjweb
  class Tile < ActiveRecord::Base
    has_many :contents
  end
end
