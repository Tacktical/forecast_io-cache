require 'forecast_io/cache/forecast'

describe 'producing a forecast' do

  let(:forecast) { Forecast::IO::Cache::Forecast.new store, generate }

  %w[generate lat lon time data store].map do |name|
    let(name) { double name }
  end

  context 'when cached data exists' do
    before { allow(store).to receive(:fetch).and_return data }

    it 'checks the store for a previous cached result' do
      expect(store).to receive(:fetch).with(lat, lon, time)
      forecast.for lat, lon, time
    end

    it 'returns the cached result when it exists' do
      expect(forecast.for lat, lon, time).to eq data
    end
  end

  context 'when cached data doesnt exist' do
    before do
      allow(generate).to receive(:for).and_return data
      allow(store).to receive(:fetch)
    end

    it 'checks the store for a previous cached result but then calls the generate' do
      expect(store).to receive(:fetch).with(lat, lon, time)
      expect(generate).to receive(:for).with(lat, lon, time, store)
      forecast.for lat, lon, time
    end

    it 'returns the stored result' do
      expect(forecast.for lat, lon, time).to eq data
    end
  end

end
