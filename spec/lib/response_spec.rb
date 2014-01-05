require 'spec_helper'

describe Weather::Response, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:invalid_response) { Weather.lookup 8888888888 }

  it 'should contain a Weather::Astronomy object' do
    expect(response.astronomy).to be_a Weather::Astronomy
  end

  it 'should contain a Weather::Location object' do
    expect(response.location).to be_a Weather::Location
  end

  it 'should contain a Weather::Units object' do
    expect(response.units).to be_a Weather::Units
  end

  it 'should contain a Weather::Wind object' do
    expect(response.wind).to be_a Weather::Wind
  end

  it 'should contain a Weather::Atmosphere object' do
    expect(response.atmosphere).to be_a Weather::Atmosphere
  end

  it 'should contain a Weather::Condition object' do
    expect(response.condition).to be_a Weather::Condition
  end

  it 'should contain a collection of Weather::Forecast objects' do
    expect(response.forecasts[0]).to be_a Weather::Forecast
  end

  it 'should contain a Weather::Image object' do
    expect(response.image).to be_a Weather::Image
  end

  it 'should contain the WOEID of the request location and the requested URL' do
    expect(response.request_location).to eq 9848
    expect(response.request_url).to eq "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D9848%20and%20u%3D'c'&format=json"
  end

  it 'should return a RuntimeError for an invalid WOEID' do
    expect { invalid_response.location }.to raise_error(RuntimeError, /Failed to get weather/i)
  end

  it 'should contain a HTML description summarizing weather conditions' do
    expect(response.description).to be_a String
  end

  it 'should contain a String title' do
    expect(response.title).to be_a String
  end

  it 'should contain latitude and longitude in floats' do
    expect(response.latitude).to be_a Float
    expect(response.longitude).to be_a Float
  end
end
