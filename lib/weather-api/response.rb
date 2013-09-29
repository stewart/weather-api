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

      @astronomy  = Astronomy.new doc[:astronomy]
      @location   = Location.new doc[:location]
      @units      = Units.new doc[:units]
      @wind       = Wind.new doc[:wind]
      @atmosphere = Atmosphere.new doc[:atmosphere]
      @image      = Image.new doc[:item][:description]

      @forecasts = []

      @condition  = Condition.new doc[:item][:condition]

      doc[:item][:forecast].each do |forecast|
        @forecasts << Forecast.new(forecast)
      end

      @latitude    = doc[:item][:lat].to_f
      @longitude   = doc[:item][:long].to_f
      @title       = doc[:item][:title]
      @description = doc[:item][:description]
    end
  end
end
