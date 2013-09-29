require 'spec_helper'

describe Weather::Image, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:image) { response.image }

  it 'should contain a string for the image url' do
    expect(image.url).to be_a String
  end
end
