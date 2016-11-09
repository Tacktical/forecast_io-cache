require 'pg_adaptor'

module Forecast
  module IO
    module Cache
      class Configuration

        attr_writer :radius, :timeframe
        attr_reader :db_uri, :db

        def radius
          @radius ||= 5
        end

        def timeframe
          @timeframe ||= 60
        end

        def db_uri= value
          @db_uri = value
          @db = PGAdaptor.db = Sequel.connect(db_uri)
          value
        end

      end
    end
  end
end
