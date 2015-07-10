# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'satriani/version'

Gem::Specification.new do |spec|
  spec.name          = "satriani"
  spec.version       = Satriani::VERSION
  spec.authors       = ["Marcelo Boeira"]
  spec.email         = ["me@marceloboeira.com"]
  spec.summary       = "Study purpose only gem."
  spec.homepage      = "http://github.com/marceloboeira/satriani"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|example)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'rack', '~> 1.1', '>= 1.1.0'
  spec.add_runtime_dependency 'tilt', '~> 2.0', '>= 2.0.0'
end
