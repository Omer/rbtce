# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbtce/version'

Gem::Specification.new do |spec|
  spec.name          = "rbtce"
  spec.version       = Rbtce::VERSION
  spec.authors       = ["Omer Jakobinsky"]
  spec.email         = ["omer@jakobinsky.com"]
  spec.description   = %q{Ruby wrapper for BTC-e API (v3)}
  spec.summary       = %q{Ruby wrapper for BTC-e API (v3)}
  spec.homepage      = "https://github.com/omer/rbtce"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
