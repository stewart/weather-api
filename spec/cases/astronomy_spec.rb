require 'helper'

describe Weather::Astronomy do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain Time objects for sunrise and sunset' do
    @response.astronomy.sunrise.should be_a Time
    @response.astronomy.sunset.should  be_a Time
  end
end
