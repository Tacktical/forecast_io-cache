require './features/support/pg'
module Fixtures

  def db
    @db ||= Sequel.connect 'postgres://localhost/forecast-test'
  end

  def setup attrs = {}
    db[:forecasts].insert(
      {
        "time"         => 123456789,
        "latitude"     => -33.857444,
        "longitude"    => 151.238823,
        "wind_speed"   => 6.66,
        "wind_bearing" => 200,
        "humidity"     => 0.9,
        "pressure"     => 1015.1,
        "visibility"   => 13,
        "temperature"  => 68.72
      }.merge(attrs)
    )
  end

end
World Fixtures
