require 'spec_helper'

describe Weather::Condition, :vcr do
  let(:response) { Weather.lookup 9848 }

  subject { response.condition }

  it 'should contain a weather condition code, a date, a temperature, and a description' do
    expect(subject.code).to be_a Integer
    expect(subject.date).to be_a Time
    expect(subject.temp).to be_a Integer
    expect(subject.text).to be_a String
  end
end
