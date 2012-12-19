require 'spec_helper'

describe Weather::Atmosphere do
  use_vcr_cassette

  let(:client) { Weather::API.new }
  let(:response) { client.lookup(9848) }

  subject { response.atmosphere }

  it 'should contain a string indicating barometric pressure' do
    expect(subject.barometer).to be_a String
  end

  it 'should contain integers representing humidity and visibility' do
    expect(subject.humidity).to be_a Integer
    expect(subject.visibility).to be_a Integer
  end

  it 'should contain a float indicating atmospheric pressure' do
    expect(subject.pressure).to be_a Float
  end
end
