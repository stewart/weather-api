require 'spec_helper'

describe Weather::Astronomy do
  use_vcr_cassette

  let(:response) { Weather.lookup 9848 }

  subject { response.astronomy }

  it 'should contain Time objects for sunrise and sunset' do
    expect(subject.sunrise).to be_a Time
    expect(subject.sunset).to be_a Time
  end
end
