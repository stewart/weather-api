require 'spec_helper'

describe Weather::Response, :vcr do
  let(:response) { Weather.lookup 9848 }

  subject { response }

  it 'should contain a Weather::Astronomy object' do
    expect(subject.astronomy).to be_a Weather::Astronomy
  end

  it 'should contain a Weather::Location object' do
    expect(subject.location).to be_a Weather::Location
  end

  it 'should contain a Weather::Units object' do
    expect(subject.units).to be_a Weather::Units
  end

  it 'should contain a Weather::Wind object' do
    expect(subject.wind).to be_a Weather::Wind
  end

  it 'should contain a Weather::Atmosphere object' do
    expect(subject.atmosphere).to be_a Weather::Atmosphere
  end

  it 'should contain a Weather::Condition object' do
    expect(subject.condition).to be_a Weather::Condition
  end

  it 'should contain a collection of Weather::Forecast objects' do
    expect(subject.forecasts[0]).to be_a Weather::Forecast
  end

  it 'should contain a Weather::Image object' do
    expect(subject.image).to be_a Weather::Image
  end

  it 'should contain the WOEID of the request location and the requested URL' do
    expect(subject.request_location).to eq 9848
    expect(subject.request_url).to eq "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D9848%20and%20u%3D'f'&format=json"
  end

  it 'should contain a HTML description summarizing weather conditions' do
    expect(subject.description).to be_a String
  end

  it 'should contain a String title' do
    expect(subject.title).to be_a String
  end

  it 'should contain latitude and longitude in floats' do
    expect(subject.latitude).to be_a Float
    expect(subject.longitude).to be_a Float
  end
end
