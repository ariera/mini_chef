# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini_chef/version'

Gem::Specification.new do |spec|
  spec.name          = "mini_chef"
  spec.version       = MiniChef::VERSION
  spec.authors       = ["Fernando Sainz"]
  spec.email         = ["info@fsainz.com"]
  spec.description   = %q{Generate files based on ERB templates and configuration variables, like the Chef template does.}
  spec.summary       = %q{Generate files based on ERB templates and configuration variables, like the Chef template does.}
  spec.homepage      = "https://github.com/fsainz/mini_chef"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
