require 'spec_helper'

describe Weather::API do
  let(:api) { Weather.new }

  it 'should alias Weather to Weather::API' do
    expect(api).to be_a Weather::API
  end
end
