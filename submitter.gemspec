# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'submitter/version'

Gem::Specification.new do |spec|
  spec.name          = "submitter"
  spec.version       = Submitter::VERSION
  spec.authors       = ["Ori Wininger"]
  spec.email         = ["oriwininger0@gmail.com"]
  spec.description   = %q{submitter}
  spec.summary       = %q{submitter}
  spec.homepage      = "http://www.github.com/oriwininger/submitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
