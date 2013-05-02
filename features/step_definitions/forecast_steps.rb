require 'forecast_io'

Then "I am given the forecast as returned from forecast.io" do
  VCR.use_cassette 'forecast_for_latitude_and_longitude' do
    expect_ok { get @path }
  end
  expect(parsed_response).to eq({
    "time"         => 123456789,
    "latitude"     => -33.857444,
    "longitude"    => 151.238823,
    "wind_speed"   => 1.87,
    "wind_bearing" => 186,
    "humidity"     => 0.7,
    "pressure"     => 1013.1,
    "visibility"   => 10,
    "temperature"  => 68.47,
  })
end

Then "I am given the cached forecast" do
  expect_ok { get @path }
  expect(parsed_response).to eq({
    "time"         => 123456789,
    "latitude"     => @position[1],
    "longitude"    => @position[0],
    "wind_speed"   => 6.66,
    "wind_bearing" => 200,
    "humidity"     => 0.9,
    "pressure"     => 1015.1,
    "visibility"   => 13,
    "temperature"  => 68.72
  })
end
