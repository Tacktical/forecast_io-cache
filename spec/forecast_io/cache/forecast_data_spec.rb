require 'forecast_io/cache/forecast_data'

describe 'representing data from the api' do
  let(:forecast) { Forecast::IO::Cache::ForecastData.generate "1.1", "-1.2", data }

  let(:data) do
    {
      'time'            => time,
      'windSpeed'       => wind_speed,
      'windBearing'     => wind_bearing,
      'humidity'        => humidity,
      'temperature'     => temperature,
      'pressure'        => pressure,
      'visibility'      => visibility,
      'percipIntensity' => precip_intensity
    }
  end

  %W[time wind_speed wind_bearing humidity temperature pressure visibility precip_intensity].each do |name|
    let(name) { double name }
  end

  it "exposes time" do
    expect(forecast.time).to eq time
  end
  it "exposes position" do
    expect(forecast.position).to eq [-1.2, 1.1]
  end
  it "exposes wind_speed" do
    expect(forecast.wind_speed).to eq wind_speed
  end
  it "exposes wind_bearing" do
    expect(forecast.wind_bearing).to eq wind_bearing
  end
  it "exposes humidity" do
    expect(forecast.humidity).to eq humidity
  end
  it "exposes temperature" do
    expect(forecast.temperature).to eq temperature
  end
  it "exposes pressure" do
    expect(forecast.pressure).to eq pressure
  end
  it "exposes visibility" do
    expect(forecast.visibility).to eq visibility
  end
end
