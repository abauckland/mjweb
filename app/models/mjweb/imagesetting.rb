module Mjweb
  class Imagesetting < ActiveRecord::Base
     belongs_to :contents
     belongs_to :images
  end
end
