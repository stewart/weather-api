module Weather
  class Response
    # a Weather::Astronomy object containing sunrise and sunset
    # information for the requested location
    attr_reader :astronomy

    # a Weather::Location object containing the geographical
    # names of the requested location
    attr_reader :location

    # a Weather::Units object containig the units corresponding
    # to the information contained in the response
    attr_reader :units

    # a Weather::Wind object containing the wind information
    # for the requested location
    attr_reader :wind

    # a Weather::Atmosphere object containing the atmosphere
    # information for the requested location
    attr_reader :atmosphere

    # a Weather::Condition object detailing the current
    # conditions of the requested location
    attr_reader :condition

    # a collection of Weather::Forecast objects containing
    # high-level forecasted weather for upcoming days
    attr_reader :forecasts

    # the HTML summarizing current weather conditions for
    # the requested location
    attr_reader :description

    # a Weather::Image object containing an image icon
    # representing the current weather for the requested location
    attr_reader :image

    # the latitude for the requested location
    attr_reader :latitude

    # the longitude for the requested location
    attr_reader :longitude

    # the location string initially requested of the service.
    attr_reader :request_location

    # the url with which the Yahoo! Weather service was
    # accessed to build the response
    attr_reader :request_url

    # the title of the weather information for the requested location
    attr_reader :title

    def initialize(request_location, request_url, doc)
      # save the request params
      @request_location = request_location
      @request_url      = request_url

      # parse the xml element to get response data
      root = doc.at_xpath('/rss/channel')

      @astronomy  = Astronomy.new(root.at_xpath('yweather:astronomy'))
      @location   = Location.new(root.at_xpath('yweather:location'))
      @units      = Units.new(root.at_xpath('yweather:units'))
      @wind       = Wind.new(root.at_xpath('yweather:wind'))
      @atmosphere = Atmosphere.new(root.at_xpath('yweather:atmosphere'))
      @image      = Image.new(root.at_xpath('image'))

      item = root.at_xpath('item')
      @forecasts = []

      @condition  = Condition.new(item.at_xpath('yweather:condition'))

      item.xpath('yweather:forecast').each do |forecast|
        @forecasts << Forecast.new(forecast)
      end

      @latitude    = item.at_xpath('geo:lat').content.to_f
      @longitude   = item.at_xpath('geo:long').content.to_f
      @title       = item.at_xpath('title').content
      @description = item.at_xpath('description').content
    end
  end
end
