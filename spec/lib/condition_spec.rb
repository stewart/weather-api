require 'spec_helper'

describe Weather::Condition, :vcr do
  let(:response) { Weather.lookup 9848 }
  let(:condition) { response.condition }

  it 'should contain a weather condition code, a date, a temperature, and a description' do
    expect(condition.code).to be_a Integer
    expect(condition.date).to be_a Time
    expect(condition.temp).to be_a Integer
    expect(condition.text).to be_a String
  end
end
