require 'forecast_io/cache/generate'

describe 'generating new cached results' do

  let(:generate) { Forecast::IO::Cache::Generate.new lat, lon, time, cache, api }
  let(:api)      { double "api", forecast: data }
  let(:data)     { { "currently" => "data_1", "hourly" => { "data" => ["data_2","data_3"] } } }

  %w[lat lon time data_1 data_2 data_3 cache].each do |name|
    let(name) { double name }
  end

  before do
    Forecast::IO::Cache::ForecastData.stub(:generate) { |lat,lon,time,data| send data }
    cache.stub(:store) { |data| data }
  end

  it 'gets the forecast from the api' do
    api.should_receive(:forecast).with(lat,lon,time: time)
    generate.forecasts
  end

  it 'stores the current forecast and all the hourlies' do
    cache.should_receive(:store).with(data_1)
    cache.should_receive(:store).with(data_2)
    cache.should_receive(:store).with(data_3)
    generate.forecasts
  end

  it 'returns the forecasts' do
    expect(generate.forecasts).to eq [data_1,data_2,data_3]
  end

end
