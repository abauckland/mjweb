module Mjweb
  class Tile < ActiveRecord::Base
    has_many :contents#, inverse_of: :tile
  end
end
