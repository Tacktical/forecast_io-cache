module Forecast
  module IO
    module Cache
      class ForecastData < Struct.new(:position, :time, :wind_speed, :wind_bearing,
                                      :humidity, :pressure, :visibility, :temperature)

        def self.generate lat, lon, time, forecast
          new.tap do |data|
            data.time     = time
            data.position = [lon,lat].map(&:to_f)
            data.wind_speed       = forecast['windSpeed']
            data.wind_bearing     = forecast['windBearing']
            data.humidity         = forecast['humidity']
            data.pressure         = forecast['pressure']
            data.visibility       = forecast['visibility']
            data.temperature      = forecast['temperature']
          end
        end

        def to_json
          {
            time:         time,
            latitude:     position[1],
            longitude:    position[0],
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
