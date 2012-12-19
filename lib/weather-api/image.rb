module Weather
  class Image
    # the image height in pixels
    attr_reader :height

    # the image width in pixels
    attr_reader :width

    # the full URL to the image
    attr_reader :url

    # the link to the Yahoo! Weather home page
    attr_reader :link

    # the title of the image
    attr_reader :title

    def initialize(payload)
      @height = payload.at_xpath('height').content.to_i
      @width  = payload.at_xpath('width').content.to_i
      @url    = payload.at_xpath('url').content
      @link   = payload.at_xpath('link').content
      @title  = payload.at_xpath('title').content
    end
  end
end
