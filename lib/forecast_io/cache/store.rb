require 'mongo_adaptor'
require 'forecast_io/cache/forecast_data'

module Forecast
  module IO
    module Cache
      class Store

        def initialize config = Cache.configuration
          @config = config
          @backend = MongoAdaptor.new('forecasts',ForecastData)
        end

        def fetch lat, lon, time
          @backend.fetch 'position' => { '$near' => [lon,lat], '$maxDistance' => @config.radius },
                         'time' => { '$lt' => time+offset, '$gt' => time-offset }
        rescue Mongo::OperationFailure => error
          if index_error? error
            ensure_index!
            retry
          else
            raise
          end
        end

        private
          def offset
            @config.timeframe*60
          end

          def index_error? error
            error.message =~ /can't find any special indices/
          end

          def ensure_index!
            MongoAdaptor.db.collection('forecasts').ensure_index position: Mongo::GEO2D
          end
      end
    end
  end
end
