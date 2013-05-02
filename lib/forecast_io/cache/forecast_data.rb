module Forecast
  module IO
    module Cache
      class ForecastData < Struct.new(:position, :time, :temperature, :wind_speed, :wind_bearing,
                                      :humidity, :pressure, :visibility, :precip_intensity)
      end
    end
  end
end
