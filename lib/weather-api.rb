require 'net/http'
require 'nokogiri'
require 'cgi'

module Weather
  class << self

    # Alias for Weather::API.new
    #
    # Returns a Weather::API object
    def new
      Weather::API.new
    end

    # Delegate to Weather::API
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end

  autoload :API,        'weather-api/api'
  autoload :Astronomy,  'weather-api/astronomy'
  autoload :Atmosphere, 'weather-api/atmosphere'
  autoload :Condition,  'weather-api/condition'
  autoload :Forecast,   'weather-api/forecast'
  autoload :Image,      'weather-api/image'
  autoload :Location,   'weather-api/location'
  autoload :Response,   'weather-api/response'
  autoload :Units,      'weather-api/units'
  autoload :Utils,      'weather-api/utils'
  autoload :Version,    'weather-api/version'
  autoload :Wind,       'weather-api/wind'
end
