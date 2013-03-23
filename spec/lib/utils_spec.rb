require 'spec_helper'

describe Weather::Utils do
  it 'should parse text into a Time object' do
    expect(Weather::Utils.parse_time '2007-01-31 12:22:26').to be_a Time
  end

  it 'should return nil if passed nothing' do
    expect(Weather::Utils.parse_time).to be_nil
  end
end
