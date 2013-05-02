require 'forecast_io/cache/forecast'

describe 'producing a forecast' do

  let(:forecast) { Forecast::IO::Cache::Forecast.new store, api }

  %w[api lat lon time data store].map do |name|
    let(name) { double name }
  end

  context 'when cached data exists' do
    before { store.stub(:fetch).and_return data }

    it 'checks the store for a previous cached result' do
      store.should_receive(:fetch).with(lat, lon, time)
      forecast.for lat, lon, time
    end

    it 'returns the cached result when it exists' do
      expect(forecast.for lat, lon, time).to eq data
    end
  end

  context 'when cached data doesnt exist' do
    before do
      generate.stub(:for).and_return data
      store.stub(:fetch)
    end

    it 'checks the store for a previous cached result but then calls the generate' do
      store.should_receive(:fetch).with(lat, lon, time)
      generate.should_receive(:for).with(lat, lon, time, store)
      forecast.for lat, lon, time
    end

    it 'returns the stored result' do
      expect(forecast.for lat, lon, time).to eq data
    end
  end

end
