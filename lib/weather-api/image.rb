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

    def initialize (payload)
      @height = payload.xpath('height').first.content.to_i
      @width  = payload.xpath('width').first.content.to_i
      @url    = payload.xpath('url').first.content
      @link   = payload.xpath('link').first.content
      @title  = payload.xpath('title').first.content
    end
  end
end
