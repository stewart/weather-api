require 'helper'

describe Weather::Utils do
  it 'should parse text into a Time object' do
    time = Weather::Utils.parse_time('2007-01-31 12:22:26')
    time.should be_a Time
  end

  it 'should return nil if passed nothing' do
    time = Weather::Utils.parse_time('')
    time.should == nil
  end
end
