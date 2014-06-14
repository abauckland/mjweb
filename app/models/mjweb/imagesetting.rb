module Mjweb
  class Imagesetting < ActiveRecord::Base
     belongs_to :settings
     belongs_to :images
  end
end
