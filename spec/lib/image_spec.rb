require 'spec_helper'

describe Weather::Image do
  use_vcr_cassette

  let(:response) { Weather.lookup(9848) }

  subject { response.image }

  it 'should contain integers for image height and width' do
    expect(subject.height).to be_a Integer
    expect(subject.width).to be_a Integer
  end

  it 'should contain strings for the image url, link, and title' do
    expect(subject.url).to be_a String
    expect(subject.link).to be_a String
    expect(subject.title).to be_a String
  end
end
