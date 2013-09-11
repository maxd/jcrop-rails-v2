# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jcrop/rails/v2/version'

Gem::Specification.new do |spec|
  spec.name          = "jcrop-rails-v2"
  spec.version       = Jcrop::Rails::V2::VERSION
  spec.authors       = ["Maxim Dobryakov"]
  spec.email         = ["maxim.dobryakov@gmail.com"]
  spec.description   = %q{Jcrop asset bundle for Rails}
  spec.summary       = %q{Jcrop asset bundle for Rails}
  spec.homepage      = "https://github.com/maxd/jcrop-rails-v2"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
