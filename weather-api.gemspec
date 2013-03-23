# -*- encoding: utf-8 -*-
require File.expand_path '../lib/weather-api/version', __FILE__

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Stewart"]
  gem.email         = ["andrew@averagestudios.com"]
  gem.description   = %q{A wrapper for the Yahoo! Weather XML RSS feed}
  gem.summary       = %q{Weather-API provides an object-oriented interface to
                         the Yahoo! Weather XML RSS feed service.}
  gem.homepage      = "https://github.com/stewart/weather-api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weather-api"
  gem.require_paths = ["lib"]
  gem.version       = Weather::Version.to_s

  gem.add_dependency "nokogiri", "~> 1.5.6"
  gem.add_dependency "chronic",  "~> 0.9.1"

  gem.add_development_dependency "rspec",   "~> 2.12.0"
  gem.add_development_dependency "webmock", "~> 1.9.0"
  gem.add_development_dependency "rake",    "~> 10.0.3"
  gem.add_development_dependency "vcr",     "~> 2.3.0"
end
