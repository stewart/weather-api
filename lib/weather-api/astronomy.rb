module Weather
  class Astronomy
    # a Time object containing the sunrise time for a location
    attr_reader :sunrise

    # a Time object containing the sunset time for a location
    attr_reader :sunset

    def initialize(payload)
      @sunrise = Utils.parse_time payload[:sunrise]
      @sunset = Utils.parse_time payload[:sunset]
    end
  end
end
