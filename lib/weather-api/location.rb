module Weather
  class Location
    # the name of the city
    attr_reader :city

    # the name of the country
    attr_reader :country

    # name of the region, such as a state or province
    attr_reader :region

    def initialize(payload)
      @city = payload[:city].strip
      @country = payload[:country].strip
      @region = payload[:region].strip
    end
  end
end
