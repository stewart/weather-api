require 'helper'

describe Weather::Units do
  before do
    @client = Weather::API.new
  end

  describe 'constants' do
    it 'should have constants for celsius and farenheit' do
      Weather::Units::FARENHEIT.should == 'f'
      Weather::Units::CELSIUS.should   == 'c'
    end
  end

  describe 'defaults' do
    use_vcr_cassette

    it 'should default to imperial units' do
      response = @client.lookup(9848)

      response.units.distance.should    == 'mi'
      response.units.pressure.should    == 'in'
      response.units.speed.should       == 'mph'
      response.units.temperature.should == 'F'
    end

    it 'should switch to metric if specified' do
      response = @client.lookup(9848, 'c')

      response.units.distance.should    == 'km'
      response.units.pressure.should    == 'mb'
      response.units.speed.should       == 'km/h'
      response.units.temperature.should == 'C'
    end
  end
end
