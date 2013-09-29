require 'spec_helper'

describe Weather do
  it "should return a string" do
    expect(Weather::VERSION).to be_a String
  end
end
