module Mjweb
  class Imagesetting < ActiveRecord::Base
     belongs_to :content
     belongs_to :image
  end
end
