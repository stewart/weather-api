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

    # a link to the Yahoo! Weather page for the requested location
    attr_reader :page_url

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
      root = doc.xpath('/rss/channel').first

      @astronomy  = Weather::Astronomy.new(root.xpath('yweather:astronomy').first)
      @location   = Weather::Location.new(root.xpath('yweather:location').first)
      @units      = Weather::Units.new(root.xpath('yweather:units').first)
      @wind       = Weather::Wind.new(root.xpath('yweather:wind').first)
      @atmosphere = Weather::Atmosphere.new(root.xpath('yweather:atmosphere').first)
      @image      = Weather::Image.new(root.xpath('image').first)

      item = root.xpath('item').first
      @forecasts = []

      @condition  = Weather::Condition.new(item.xpath('yweather:condition').first)

      item.xpath('yweather:forecast').each do |forecast|
        @forecasts << Weather::Forecast.new(forecast)
      end

      @latitude    = item.xpath('geo:lat').first.content.to_f
      @longitude   = item.xpath('geo:long').first.content.to_f
      @page_url    = item.xpath('link').first.content
      @title       = item.xpath('title').first.content
      @description = item.xpath('description').first.content
    end
  end
end
