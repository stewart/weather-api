require 'helper'

describe Weather::Location do
  use_vcr_cassette

  before do
    @client = Weather::API.new
  end

  it 'should contain city, country, and region as strings' do
    response = @client.lookup(9848)

    response.location.city.should    be_a String
    response.location.region.should  be_a String
    response.location.country.should be_a String
  end

  it 'should be able to look up Seattle, WA' do
    response = @client.lookup(2490383)

    response.location.city.should    == 'Seattle'
    response.location.region.should  == 'WA'
    response.location.country.should == 'United States'
  end

  it 'should be able to look up Victoria, BC' do
    response = @client.lookup(9848)

    response.location.city.should    == 'Victoria'
    response.location.region.should  == 'BC'
    response.location.country.should == 'Canada'
  end

  it 'should be able to look up Nice, France' do
    response = @client.lookup(614274)

    response.location.city.should    == 'Nice'
    response.location.region.should  == ''
    response.location.country.should == 'France'
  end
end
