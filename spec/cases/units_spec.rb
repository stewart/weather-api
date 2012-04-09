require 'helper'

describe Weather::Units do
  describe 'constants' do
    it 'should have constants for celsius and farenheit' do
      Weather::Units::FARENHEIT.should == 'f'
      Weather::Units::CELSIUS.should   == 'c'
    end
  end
end
