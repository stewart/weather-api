require 'spec_helper'

describe Weather::Atmosphere, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:atmosphere) { response.atmosphere }

  it 'should contain a string indicating barometric pressure' do
    expect(atmosphere.barometer).to be_a String
  end

  it 'should contain integers representing humidity and visibility' do
    expect(atmosphere.humidity).to be_a Integer
    expect(atmosphere.visibility).to be_a Integer
  end

  it 'should contain a float indicating atmospheric pressure' do
    expect(atmosphere.pressure).to be_a Float
  end
end
