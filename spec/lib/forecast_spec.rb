require 'spec_helper'

describe Weather::Forecast do
  use_vcr_cassette

  let(:client) { Weather::API.new }
  let(:response) { client.lookup(9848) }

  subject { response.forecasts[0] }

  it 'should have an associated date' do
    expect(subject.date).to be_a Time
  end

  it 'should contain high and low forecasts' do
    expect(subject.high).to be_a Integer
    expect(subject.low).to be_a Integer
  end

  it 'should contain the name of the day associated with the forecast' do
    expect(subject.day).to be_a String
  end

  it 'should have a weather condition code' do
    expect(subject.code).to be_a Integer
  end

  it 'should have a brief description of the forecasted conditions' do
    expect(subject.text).to be_a String
  end
end
