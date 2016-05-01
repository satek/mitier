# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mitier/version'

Gem::Specification.new do |spec|
  spec.name          = 'mitier'
  spec.version       = Mitier::VERSION
  spec.authors       = ['Marko Satek']
  spec.email         = ['satekm@gmail.com']

  spec.summary       = 'Ruby wrap for MITIE library. See https://github.com/mit-nlp/MITIE'
  spec.homepage      = 'http://github.com/satek/mitier'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ffi', '~> 1.9.10'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'dotenv', '~> 2.1.1'
  spec.add_development_dependency 'rubocop', '~> 0.39.0'
end
