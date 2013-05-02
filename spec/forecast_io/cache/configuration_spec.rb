require 'forecast_io/cache/configuration'

describe 'service configuration' do

  let(:config) { Forecast::IO::Cache::Configuration.new }

  it 'has a radius default of 5' do
    expect(config.radius).to eq 5
  end

  it 'has a configurable radius' do
    config.radius = 12
    expect(config.radius).to eq 12
  end

  it 'has a default timeframe of 60' do
    expect(config.timeframe).to eq 60
  end

  it 'has a configurable timeframe' do
    config.timeframe = 12
    expect(config.timeframe).to eq 12
  end

  it 'loads mongo config urls' do
    Mongo::Configure.should_receive(:from_uri).with 'mongodb://example.com'
    config.mongo_uri 'mongodb://example.com'
  end

end
