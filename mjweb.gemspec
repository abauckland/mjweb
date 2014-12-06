$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mjweb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mjweb"
  s.version     = Mjweb::VERSION
  s.authors     = "Andrew Burton"
  s.email       = "abauckland@gmail.com"
  s.homepage    = "https://myhq.org.uk"
  s.summary     = "Web Application"
  s.description = "Web Application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  
  s.add_dependency  'pundit'
  s.add_dependency  'carrierwave'
  s.add_dependency 'colorist'
  s.add_dependency  'rmagick', "= 2.13.3"
  s.add_development_dependency  'sass-rails', '~> 4.0.3'
  s.add_development_dependency  'coffee-rails', '~> 4.0.0'
  s.add_development_dependency  'tzinfo-data'
  s.add_development_dependency  'jquery-rails' 
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'fog'  
end
