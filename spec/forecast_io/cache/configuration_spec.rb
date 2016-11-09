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

  it 'loads db from db_uri' do
    config.db_uri = 'postgres://localhost/forecast-test'
    expect(config.db).to be_a Sequel::Database
    expect(config.db.opts[:database]).to eq 'forecast-test'
    expect(PGAdaptor.db).to eq config.db
  end

end
