$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_submitted/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_submitted"
  s.version     = UserSubmitted::VERSION
  s.authors     = ["Michael Smith"]
  s.email       = ["msmith@bcimedia.com"]
  s.summary     = %q{Storing user-submitted content}
  s.description = %q{Gem for requesting user-submitted photos and videos through a widget. Admins can then approve or reject the content for public display. All content is editable and can also be created in bulk by an admin.}
  s.homepage    = "https://github.com/BCIMedia/user_submitted"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "mysql2", "~> 0.5.2"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "webmock"
end
