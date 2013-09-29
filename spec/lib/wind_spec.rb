require 'spec_helper'

describe Weather::Wind, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:wind) { response.wind }

  it 'should contain chill, direction, and speed as integers' do
    expect(wind.chill).to be_a Integer
    expect(wind.direction).to be_a Integer
    expect(wind.speed).to be_a Integer
  end
end
