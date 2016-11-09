require 'forecast_io/cache/forecast_data'

module Forecast
  module IO
    module Cache
      class Generate

        def self.for lat, lon, time, cache
          new(lat, lon, time, cache).forecasts.first
        end

        def initialize lat, lon, time, cache, api = ::ForecastIO
          @lat, @lon, @time, @cache, @api = lat, lon, time, cache, api
        end

        def forecasts
          ([current] + hourly).map do |forecast|
            @cache.store generate forecast
          end
        end

        private
          def current
            forecast["currently"]
          end

          def hourly
            forecast["hourly"]["data"]
          end

          def forecast
            @forecast ||= @api.forecast @lat, @lon, time: @time
          end

          def generate data
            ForecastData.generate @lat, @lon, data
          end

      end
    end
  end
end
