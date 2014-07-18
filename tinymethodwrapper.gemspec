# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinymethodwrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "tinymethodwrapper"
  spec.version       = Tinymethodwrapper::VERSION
  spec.authors       = ["Hendrik Kleinwaechter"]
  spec.email         = ["hendrik.kleinwaechter@gmail.com"]
  spec.summary       = %q{Really tiny library for wrapping ruby methods with a prefix call.}
  spec.description   = %q{Great for doing debugging and logging deprecated methods}
  spec.homepage      = "http://zeit.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7"
  spec.add_development_dependency "pry", '~> 0.9.12'

end
