require 'helper'

describe Weather::Image do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain integers for image height and width' do
    @response.image.height.should be_a Integer
    @response.image.width.should  be_a Integer
  end

  it 'should contain strings for the image url, link, and title' do
    @response.image.url.should   be_a String
    @response.image.link.should  be_a String
    @response.image.title.should be_a String
  end
end
