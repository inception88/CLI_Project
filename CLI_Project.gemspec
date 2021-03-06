
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "CLI_Project/version"

Gem::Specification.new do |spec|
  spec.name          = "CLI_Project"
  spec.version       = CLIProject::VERSION
  spec.authors       = ["'Benjamin Jones'"]
  spec.email         = ["'bljones36@gmail.com'"]

  spec.summary       = "EnterAction Apparel's featured products"
  spec.description   = "Pulls all of the featured products on the EnterAction Apparel Website: enteractionapparel.com"
  spec.homepage      = "https://github.com/inception88/CLI_Project"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ["lib/CLI_Project.rb", "lib/CLI_Project/cli.rb", "lib/CLI_Project/scraper.rb", "lib/CLI_Project/product.rb", "config/environment.rb", "bin/console"]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.executables << 'enteraction-apparel'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
