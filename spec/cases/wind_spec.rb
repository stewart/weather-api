require 'helper'

describe Weather::Wind do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain chill, direction, and speed as integers' do
    @response.wind.chill.should     be_a Integer
    @response.wind.direction.should be_a Integer
    @response.wind.speed.should     be_a Integer
  end
end
