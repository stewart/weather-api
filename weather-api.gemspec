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

  gem.add_dependency "chronic", "~> 0.10.2"
  gem.add_dependency "map", "~> 6.5.1"
  gem.add_development_dependency "rspec", "~> 2.14.1"
  gem.add_development_dependency "webmock", "~> 1.13.0"
  gem.add_development_dependency "rake", "~> 10.1.0"
  gem.add_development_dependency "vcr", "~> 2.6.0"
end
