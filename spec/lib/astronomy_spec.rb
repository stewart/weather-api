require 'spec_helper'

describe Weather::Astronomy, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:astronomy) { response.astronomy }

  it 'should contain Time objects for sunrise and sunset' do
    expect(astronomy.sunrise).to be_a Time
    expect(astronomy.sunset).to be_a Time
  end
end
