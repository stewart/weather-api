require "helper"

describe Weather::Version do
  it "should return a string" do
    string = Weather::Version.to_s
    string.should be_a String
  end
end
