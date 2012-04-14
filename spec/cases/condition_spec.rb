require 'helper'

describe Weather::Condition do
  use_vcr_cassette

  before do
    @client = Weather::API.new
    @response = @client.lookup(9848)
  end

  it 'should contain a weather condition code, a date, a temperature, and a description' do
    @response.condition.code.should be_a Integer
    @response.condition.date.should be_a Time
    @response.condition.temp.should be_a Integer
    @response.condition.text.should be_a String
  end
end
