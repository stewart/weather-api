require 'spec_helper'

describe Weather::Units do
  describe 'constants' do
    it 'should have constants for celsius and farenheit' do
      expect(Weather::Units::FARENHEIT).to eq 'f'
      expect(Weather::Units::CELSIUS).to eq 'c'
    end
  end

  describe 'defaults', :vcr do
    it 'should default to metric units' do
      response = Weather.lookup 9848

      expect(response.units.distance).to eq 'km'
      expect(response.units.pressure).to eq 'mb'
      expect(response.units.speed).to eq 'km/h'
      expect(response.units.temperature).to eq 'C'
    end

    it 'should switch to imperial if specified' do
      response = Weather.lookup 9848, Weather::Units::FARENHEIT

      expect(response.units.distance).to eq 'mi'
      expect(response.units.pressure).to eq 'in'
      expect(response.units.speed).to eq 'mph'
      expect(response.units.temperature).to eq 'F'
    end
  end
end
