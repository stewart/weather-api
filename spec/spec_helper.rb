require "weather-api"

require "rspec"
require "webmock/rspec"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir     = "spec/fixtures/cassettes"
  config.hook_into                :webmock
  config.ignore_localhost         = true
  config.default_cassette_options = { :record => :new_episodes }
  config.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
