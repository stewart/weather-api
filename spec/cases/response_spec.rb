require 'helper'

describe Weather::Response do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain a Weather::Astronomy object' do
    @response.astronomy.should be_a Weather::Astronomy
  end

  it 'should contain a Weather::Location object' do
    @response.location.should be_a Weather::Location
  end

  it 'should contain a Weather::Units object' do
    @response.units.should be_a Weather::Units
  end

  it 'should contain a Weather::Wind object' do
    @response.wind.should be_a Weather::Wind
  end

  it 'should contain a Weather::Atmosphere object' do
    @response.atmosphere.should be_a Weather::Atmosphere
  end

  it 'should contain a Weather::Condition object' do
    @response.condition.should be_a Weather::Condition
  end

  it 'should contain a collection of Weather::Forecast objects' do
    @response.forecasts[0].should be_a Weather::Forecast
  end

  it 'should contain a Weather::Image object' do
    @response.image.should be_a Weather::Image
  end

  it 'should contain the WOEID of the request location and the requested URL' do
    @response.request_location.should == 9848
    @response.request_url.should == "http://weather.yahooapis.com/forecastrss?w=9848&u=f"
  end

  it 'should contain a HTML description summarizing weather conditions' do
    @response.description.should be_a String
  end

  it 'should contain a String title' do
    @response.title.should be_a String
  end

  it 'should contain latitude and longitude in floats' do
    @response.latitude.should  be_a Float
    @response.longitude.should be_a Float
  end
end
