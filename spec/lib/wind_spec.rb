require 'spec_helper'

describe Weather::Wind do
  use_vcr_cassette

  let(:client) { Weather::API.new }
  let(:response) { client.lookup(9848) }

  subject { response.wind }

  it 'should contain chill, direction, and speed as integers' do
    expect(subject.chill).to be_a Integer
    expect(subject.direction).to be_a Integer
    expect(subject.speed).to be_a Integer
  end
end
