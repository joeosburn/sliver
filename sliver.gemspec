# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sliver/version'

Gem::Specification.new do |spec|
  spec.name          = 'sliver'
  spec.version       = Sliver::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ['Joe Osburn']
  spec.email         = ['joe@jnodev.com']

  spec.summary       = 'Sliver a sliver of a web application server'
  spec.homepage      = 'https://github.com/joeosburn/sliver'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.test_files = Dir['spec/**/*']

  spec.add_dependency 'fcore', '~> 0.0.1'
end
