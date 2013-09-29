require 'spec_helper'

describe Weather::Forecast, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:forecast) { response.forecasts[0] }

  it 'should have an associated date' do
    expect(forecast.date).to be_a Time
  end

  it 'should contain high and low forecasts' do
    expect(forecast.high).to be_a Integer
    expect(forecast.low).to be_a Integer
  end

  it 'should contain the name of the day associated with the forecast' do
    expect(forecast.day).to be_a String
  end

  it 'should have a weather condition code' do
    expect(forecast.code).to be_a Integer
  end

  it 'should have a brief description of the forecasted conditions' do
    expect(forecast.text).to be_a String
  end
end
