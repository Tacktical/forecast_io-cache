module Forecast
  module IO
    module Cache
      class ForecastData < Struct.new(:latitude, :longitude, :time, :wind_speed, :wind_bearing,
                                      :humidity, :pressure, :visibility, :temperature)

        def self.generate lat, lon, forecast
          new.tap do |data|
            data.latitude     = lat.to_f
            data.longitude    = lon.to_f
            data.time         = forecast['time']
            data.wind_speed   = forecast['windSpeed']
            data.wind_bearing = forecast['windBearing']
            data.humidity     = forecast['humidity']
            data.pressure     = forecast['pressure']
            data.visibility   = forecast['visibility']
            data.temperature  = forecast['temperature']
          end
        end

        def to_json
          {
            time:         time,
            latitude:     latitude,
            longitude:    longitude,
            wind_speed:   wind_speed,
            wind_bearing: wind_bearing,
            humidity:     humidity,
            pressure:     pressure,
            visibility:   visibility,
            temperature:  temperature
          }
        end

      end
    end
  end
end
