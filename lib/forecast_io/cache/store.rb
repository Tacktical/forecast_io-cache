require 'pg_adaptor'
require 'forecast_io/cache/forecast_data'

module Forecast
  module IO
    module Cache
      class Store

        def initialize config = Cache.configuration
          @config = config
          @backend = PGAdaptor.new('forecasts', ForecastData)
        end

        def fetch lat, lon, time
          @backend.fetch Sequel.lit(<<-SQL, start: time - offset, end: time + offset, lat: lat, lon: lon, radius: radius)
            time >= :start AND time <= :end AND earth_box(
              ll_to_earth(:lat, :lon), :radius
            ) @> ll_to_earth(
              latitude,
              longitude
            )
            SQL
        end

        def store forecast
          @backend.insert forecast
          forecast
        end

      private

        def radius
          # nm to m
          @config.radius * 1852
        end

        def offset
          @config.timeframe * 60
        end

      end
    end
  end
end
