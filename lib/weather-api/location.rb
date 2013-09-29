module Weather
  class Location
    # the name of the city
    attr_reader :city

    # the name of the country
    attr_reader :country

    # name of the region, such as a state or province
    attr_reader :region

    def initialize(payload)
      @city = payload[:city]
      @country = payload[:country]
      @region = payload[:region]
    end
  end
end
