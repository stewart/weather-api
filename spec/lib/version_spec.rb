require 'spec_helper'

describe Weather::Version do
  it "should return a string" do
    expect(Weather::Version.to_s).to be_a String
  end
end
