require 'net/http'
require 'nokogiri'
require 'cgi'

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
    ENDPOINT = "http://weather.yahooapis.com/forecastrss"

    # Public: Looks up current weather information using WOEID
    #
    # woeid - Int - Where On Earth IDentifier -- unique ID for
    #         location to get weather data for. To find
    #         a WOEID, refer to Yahoo!'s documentation
    #         at http://developer.yahoo.com/weather/
    #
    # units - String - whether to retrieve data in Farenheit
    #         or Celsius. Defaults to Farenheit
    #
    # Returns a Weather::Response object containing forecast
    def lookup(woeid, units = 'f')
      url = ENDPOINT + "?w=#{CGI.escape(woeid.to_s)}&u=#{CGI.escape(units.downcase)}"

      begin
        response = Net::HTTP.get_response(URI.parse(url)).body.to_s
      rescue => e
        raise RuntimeError.new("Failed to get weather [woeid=#{woeid}, url=#{url}, e=#{e}].")
      end

      # parse returned XML
      doc = Nokogiri::XML.parse(response)

      # create response object
      Response.new(woeid, url, doc)
    end
  end
end
