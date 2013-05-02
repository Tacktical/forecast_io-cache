module Forecast
  module IO
    module Cache
      class Forecast

        def initialize cache = Store.new, api = Generate.new
          @cache, @api = cache, api
        end

        def for lat, lon, time
          cached(lat, lon, time) or fetch_and_store(lat, lon, time)
        end

        private
          def cached lat, lon, time
            @cache.fetch lat, lon, time
          end

          def fetch_and_store lat, lon, time
            @generate.for lat, lon, time, @cache
          end

      end
    end
  end
end
