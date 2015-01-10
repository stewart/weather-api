require 'net/http'
require 'json'
require 'map'

require 'weather-api/astronomy'
require 'weather-api/atmosphere'
require 'weather-api/condition'
require 'weather-api/forecast'
require 'weather-api/image'
require 'weather-api/location'
require 'weather-api/response'
require 'weather-api/units'
require 'weather-api/utils'
require 'weather-api/version'
require 'weather-api/wind'

module Weather
  class << self
    # Yahoo! Weather info endpoint
    ROOT = "http://query.yahooapis.com/v1/public/yql"

    # Public: Looks up current weather information using WOEID
    #
    # woeid - Int - Where On Earth IDentifier -- unique ID for
    #         location to get weather data for. To find
    #         a WOEID, refer to Yahoo!'s documentation
    #         at http://developer.yahoo.com/weather/
    #
    # unit - system of measurement to use. Two acceptable inputs:
    #        'c' - Celsius/Metric measurements
    #        'f' - Fahrenheit/Imperial measurements.
    #
    #        To make this easier, you can use the Weather::Units::FAHRENHEIT and
    #        Weather::Units::CELSIUS constants. Defaults to Celsius
    #
    # Returns a Weather::Response object containing forecast
    def lookup(woeid, unit = Units::CELSIUS)
      acceptable_units = [Units::CELSIUS, Units::FAHRENHEIT]
      unit = Units::CELSIUS unless acceptable_units.include?(unit)

      url = ROOT + "?q=select%20*%20from%20weather.forecast%20"
      url += "where%20woeid%3D#{woeid}%20and%20u%3D'#{unit}'&format=json"

      doc = get_response url
      Response.new woeid, url, doc
    end

    private
    def get_response url
      begin
        response = Net::HTTP.get_response(URI.parse url).body.to_s
      rescue => e
        raise "Failed to get weather [url=#{url}, e=#{e}]."
      end

      response = Map.new(JSON.parse(response))[:query][:results][:channel]

      if response.nil? or response.title.match(/error/i)
        raise "Failed to get weather [url=#{url}]."
      end

      response
    end
  end
end
