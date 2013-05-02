require './features/support/mongo'
module Fixtures

  def setup attrs = {}
    MongoAdaptor.db.collection('forecasts').insert(
      {
        "time"         => 123456789,
        "position"     => [151.238823,-33.857444],
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
