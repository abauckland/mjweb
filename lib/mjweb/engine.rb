
module Mjweb
  class Engine < ::Rails::Engine
    isolate_namespace Mjweb

    initializer :assets do |config|
      Rails.application.config.assets.paths << root.join("app", "assets", "images", "mjweb")
    end

  end
end
