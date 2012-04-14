require 'helper'

describe Weather::API do
  it 'should alias Weather to Weather::API' do
    @api = Weather.new
    @api.should be_a Weather::API
  end
end
