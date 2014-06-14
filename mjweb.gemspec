$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mjweb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mjweb"
  s.version     = Mjweb::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Mjweb."
  s.description = "TODO: Description of Mjweb."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency 'paperclip', "~> 4.1"
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'bootstrap_form'
  s.add_dependency 'sass-rails', '~> 4.0.3'
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'tzinfo-data'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'mysql2'
end
