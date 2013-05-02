require 'support/mongo'
require 'forecast_io/cache/store'

describe database: true do
  let(:config) { double radius: 1, timeframe: 3 }
  let(:store)  { Forecast::IO::Cache::Store.new config }
  let(:mongo)  { MongoAdaptor.new('forecasts',data) }
  let(:data)   { Forecast::IO::Cache::ForecastData }

  describe 'retrieving forecasts from the store' do
    let(:forecast_1) { data.new [151.23775,-33.858264], 1 }
    let(:forecast_2) { data.new [151.23675,-33.858664], 3 }

    before do
      mongo.insert forecast_1
      mongo.insert forecast_2
    end

    it 'will return the closet forecast' do
      expect(store.fetch -33.858254, 151.23775, 3).to eq forecast_1
    end
    it 'will return a forecast nearby' do
      expect(store.fetch -33.858254, 151.23780, 2).to eq forecast_1
    end
    it 'will not return a forecast outside the time params' do
      expect(store.fetch -33.858254, 151.23780, 200).to eq nil
    end
  end

  describe 'inserting forecasts into the store' do
  end

end
