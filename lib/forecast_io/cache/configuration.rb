require 'mongo-configure'

module Forecast
  module IO
    module Cache
      class Configuration

        attr_writer :radius, :timeframe

        def radius
          @radius ||= 5
        end

        def timeframe
          @timeframe ||= 60
        end

        def mongo_uri uri
          Mongo::Configure.from_uri uri
        end

      end
    end
  end
end
