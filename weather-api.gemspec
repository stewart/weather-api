# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weather-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Stewart"]
  gem.email         = ["andrew@averagestudios.com"]
  gem.description   = %q{A wrapper for the Yahoo! Weather XML RSS feed}
  gem.summary       = %q{Weather-API provides an object-oriented interface to the Yahoo! Weather XML RSS feed service.}
  gem.homepage      = "https://github.com/stewart/weather-api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weather-api"
  gem.require_paths = ["lib"]
  gem.version       = Weather::Version.to_s

  gem.add_dependency "httparty", "~> 0.8.1"
  gem.add_dependency "nokogiri", "~> 1.5.2"
  gem.add_dependency "chronic",  "~> 0.6.7"

  gem.add_development_dependency "guard-rspec", "~> 0.7.0"
  gem.add_development_dependency "simplecov",   "~> 0.6.1"
  gem.add_development_dependency "rspec",       "~> 2.9.0"
  gem.add_development_dependency "webmock",     "~> 1.8.6"
  gem.add_development_dependency "guard",       "~> 1.0.1"
  gem.add_development_dependency "rake",        "~> 0.9.2.2"
  gem.add_development_dependency "vcr",         "~> 2.0.1"
end
