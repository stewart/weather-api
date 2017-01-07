# -*- encoding: utf-8 -*-
require File.expand_path '../lib/weather-api/version', __FILE__

Gem::Specification.new do |spec|
  spec.name          = "weather-api"
  spec.version       = Weather::VERSION
  spec.authors       = ["Andrew Stewart"]
  spec.email         = ["andrew@stwrt.com"]
  spec.description   = %q{A wrapper for the Yahoo! Weather XML RSS feed}
  spec.summary       = %q{Weather-API provides an object-oriented interface to
                         the Yahoo! Weather XML RSS feed service.}
  spec.homepage      = "https://github.com/stewart/weather-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chronic", "~> 0.10.2"
  spec.add_dependency "map", "~> 6.6.0"
  spec.add_dependency "json"
  spec.add_development_dependency "rspec", "~> 3.5.0"
  spec.add_development_dependency "webmock", "~> 2.3.2"
  spec.add_development_dependency "rake", "~> 11.2.2"
  spec.add_development_dependency "vcr", "~> 3.0.3"
end
