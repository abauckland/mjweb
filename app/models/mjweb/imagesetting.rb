module Mjweb
  class Imagesetting < ActiveRecord::Base
     belongs_to :content
     belongs_to :image

#  validates :content, presence: true
#  validates :image, presence: true

  end
end
