module Weather
  class Wind
    # the temperature, with wind chill factored in
    attr_reader :chill

    # the direction of the wind in degrees
    attr_reader :direction

    # the windspeed
    attr_reader :speed

    def initialize(payload)
      @chill = payload[:chill].to_i
      @direction = payload[:direction].to_i
      @speed = payload[:speed].to_i
    end
  end
end
