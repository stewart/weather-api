module Weather
  class Image
    # the full URL to the image
    attr_reader :url

    def initialize(payload)
      @url = payload.scan(/src=\"(.*)\"/).flatten.first
    end
  end
end
