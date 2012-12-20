module Weather
  class Image
    # the full URL to the image
    attr_reader :url

    def initialize(payload)
      @url = payload.at_css('img').attr("src")
    end
  end
end
