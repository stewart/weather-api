module Weather
  class Atmosphere
    class Barometer
      STEADY  = 'steady'
      RISING  = 'rising'
      FALLING = 'falling'

      # list of all possible barometer constants
      ALL = [STEADY, RISING, FALLING]
    end

    # air humidity
    attr_reader :humidity

    # visibility of the surroundings
    attr_reader :visibility

    # air pressure level
    attr_reader :pressure

    # barometer state, defined as one of the contants
    # in Weather::Atmosphere::Barometer
    attr_reader :barometer

    def initialize(payload)
      @humidity   = payload[:humidity].to_i
      @visibility = payload[:visibility].to_i
      @pressure   = payload[:pressure].to_f

      # map barometric pressure to appropriate constant
      @barometer = nil

      case payload[:rising].to_i
        when 0 then @barometer = Barometer::STEADY
        when 1 then @barometer = Barometer::RISING
        when 2 then @barometer = Barometer::FALLING
      end
    end
  end
end
