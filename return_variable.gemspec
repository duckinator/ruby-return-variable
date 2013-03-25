# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'return_variable/version'

Gem::Specification.new do |spec|
  spec.name          = "return_variable"
  spec.version       = ReturnVariable::VERSION
  spec.authors       = ["Nick Markwell"]
  spec.email         = ["nick@duckinator.net"]
  spec.description   = %q{Allow return=X to specify the return value of a function, if an explicit return is used.}
  spec.summary       = %q{Allow return=X to specify the return value of a function, if an explicit return is used.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
