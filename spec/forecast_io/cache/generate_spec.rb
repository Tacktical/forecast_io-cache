require 'forecast_io/cache/generate'

describe 'generating new cached results' do

  let(:generate) { Forecast::IO::Cache::Generate.new lat, lon, time, cache, api }
  let(:api)      { double "api", forecast: data }
  let(:data)     { { "currently" => "data_1", "hourly" => { "data" => ["data_2","data_3"] } } }

  %w[lat lon time data_1 data_2 data_3 cache].each do |name|
    let(name) { double name }
  end

  before do
    allow(Forecast::IO::Cache::ForecastData).to receive(:generate) { |lat,lon,data| send data }
    allow(cache).to receive(:store) { |data| data }
  end

  it 'gets the forecast from the api' do
    expect(api).to receive(:forecast).with(lat,lon,time: time)
    generate.forecasts
  end

  it 'generate forecase data objects' do
    expect(Forecast::IO::Cache::ForecastData).to receive(:generate).with(lat,lon,"data_1")
    expect(Forecast::IO::Cache::ForecastData).to receive(:generate).with(lat,lon,"data_2")
    expect(Forecast::IO::Cache::ForecastData).to receive(:generate).with(lat,lon,"data_3")
    generate.forecasts
  end

  it 'stores the current forecast and all the hourlies' do
    expect(cache).to receive(:store).with(data_1)
    expect(cache).to receive(:store).with(data_2)
    expect(cache).to receive(:store).with(data_3)
    generate.forecasts
  end

  it 'returns the forecasts' do
    expect(generate.forecasts).to eq [data_1,data_2,data_3]
  end

end
