require "forecast_io/cache/version"
require "forecast_io/cache/app"

module Forecast
  module IO
    module Cache

      def self.new(*args)
        App.new *args
      end

    end
  end
end
