# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'return_variable/version'

Gem::Specification.new do |spec|
  spec.name          = "return_variable"
  spec.version       = ReturnVariable::VERSION
  spec.authors       = ["Nick Markwell"]
  spec.email         = ["nick@duckinator.net"]
  spec.description   = %q{Allow return=X to specify the return value of a function.}
  spec.summary       = %q{Allow return=X to specify the return value of a function.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruby2ruby",   "~> 2.0.4"
  spec.add_runtime_dependency "ruby_parser", "~> 3.1.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
