require 'spec_helper'

describe Weather::Location, :vcr do
  it 'should contain city, country, and region as strings' do
    response = Weather.lookup 9848

    expect(response.location.city).to be_a String
    expect(response.location.city).to be_a String
    expect(response.location.region).to be_a String
    expect(response.location.country).to be_a String
  end

  it 'should be able to look up Seattle, WA' do
    response = Weather.lookup 2490383

    expect(response.location.city).to eq 'Seattle'
    expect(response.location.region).to eq 'WA'
    expect(response.location.country).to eq 'United States'
  end

  it 'should be able to look up Victoria, BC' do
    response = Weather.lookup 9848

    expect(response.location.city).to eq 'Victoria'
    expect(response.location.region).to eq 'BC'
    expect(response.location.country).to eq 'Canada'
  end

  it 'should be able to look up Nice, France' do
    response = Weather.lookup 614274

    expect(response.location.city).to eq 'Nice'
    expect(response.location.region).to eq ''
    expect(response.location.country).to eq 'France'
  end
end
