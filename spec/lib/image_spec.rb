require 'spec_helper'

describe Weather::Image do
  use_vcr_cassette

  let(:response) { Weather.lookup(9848) }

  subject { response.image }

  it 'should contain a string for the image url' do
    expect(subject.url).to be_a String
  end
end
