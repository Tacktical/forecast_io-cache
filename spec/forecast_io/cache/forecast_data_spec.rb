require 'forecast_io/cache/forecast_data'

describe 'representing data from the api' do
  subject { Forecast::IO::Cache::ForecastData.generate "1.1", "-1.2", time, data }

  let(:data) do
    {
      'windSpeed'       => wind_speed,
      'windBearing'     => wind_bearing,
      'humidity'        => humidity,
      'temperature'     => temperature,
      'pressure'        => pressure,
      'visibility'      => visibility,
      'percipIntensity' => percip_intensity
    }
  end

  %W[time wind_speed wind_bearing humidity temperature pressure visibility percip_intensity].each do |name|
    let(name) { double name }
  end

  its(:time)             { should eq time }
  its(:position)         { should eq [-1.2,1.1] }
  its(:wind_speed)       { wind_speed }
  its(:wind_bearing)     { wind_bearing }
  its(:humidity)         { humidity }
  its(:temperature)      { temperature }
  its(:pressure)         { pressure }
  its(:visibility)       { visibility }
  its(:precip_intensity) { percip_intensity }

end
