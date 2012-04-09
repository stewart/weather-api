module Weather
  class << self

    # Alias for Weather::API.new
    #
    # Returns a Weather::API object
    def new(options)
      Weather::API.new(options)
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

  autoload :Units,   'weather-api/units'
  autoload :Utils,   'weather-api/utils'
  autoload :Version, 'weather-api/version'
end
