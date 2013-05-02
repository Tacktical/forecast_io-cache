require 'forecast_io/cache'

describe 'Forecast::IO caching service' do

  it 'is configurable by a block' do
    Forecast::IO::Cache.configure { |config| @config = config }
    expect(@config).to be_a Forecast::IO::Cache::Configuration
  end

  it 'is retrievable' do
    Forecast::IO::Cache.configure { |config| @config = config }
    expect(Forecast::IO::Cache.configuration).to eq @config
  end

end
