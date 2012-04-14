require 'helper'

describe Weather::Forecast do
  use_vcr_cassette

  before do
    client = Weather::API.new
    response = client.lookup(9848)
    @forecast = response.forecasts[0]
  end

  it 'should have an associated date' do
    @forecast.date.should be_a Time
  end

  it 'should contain high and low forecasts' do
    @forecast.high.should be_a Integer
    @forecast.low.should  be_a Integer
  end

  it 'should contain the name of the day associated with the forecast' do
    @forecast.day.should be_a String
  end

  it 'should have a weather condition code' do
    @forecast.code.should be_a Integer
  end

  it 'should have a brief description of the forecasted conditions' do
    @forecast.text.should be_a String
  end
end
