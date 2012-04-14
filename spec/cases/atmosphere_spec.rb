require 'helper'

describe Weather::Atmosphere do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain a string indicating barometric pressure' do
    @response.atmosphere.barometer.should be_a String
  end

  it 'should contain integers representing humidity and visibility' do
    @response.atmosphere.humidity.should   be_a Integer
    @response.atmosphere.visibility.should be_a Integer
  end

  it 'should contain a float indicating atmospheric pressure' do
    @response.atmosphere.pressure.should be_a Float
  end
end
