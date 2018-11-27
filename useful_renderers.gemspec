# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'useful_renderers/version'

Gem::Specification.new do |spec|
  spec.name          = "useful_renderers"
  spec.version       = UsefulRenderers::VERSION
  spec.authors       = ["Ondrej Bartas"]
  spec.email         = ["ondrej@bartas.cz"]
  spec.summary       = 'Adds a custom CSV and ZIP renderer to Rails applications'
  spec.description   = 'Adds a custom CSV and ZIP renderer to Rails applications'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 5.0'
  spec.add_dependency 'rubyzip', '>= 1.0.0'

  spec.add_development_dependency 'rspec-rails', '>= 2.12'
  spec.add_development_dependency 'sqlite3', '>= 1.3'
  spec.add_development_dependency 'json', '>= 1.6'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
