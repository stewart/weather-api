module Weather
  class API
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
      Weather::Response.new(woeid, url, doc)
    end
  end
end
