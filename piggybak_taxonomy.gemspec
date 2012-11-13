$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "piggybak_taxonomy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "piggybak_taxonomy"
  s.version     = PiggybakTaxonomy::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PiggybakTaxonomy."
  s.description = "TODO: Description of PiggybakTaxonomy."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "ancestry"
  s.add_dependency "piggybak_rails_admin_nestable"
end
