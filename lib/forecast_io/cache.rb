require "forecast_io/cache/version"
require "forecast_io/cache/configuration"
require "forecast_io/cache/app"

module Forecast
  module IO
    module Cache

      def self.initialize!
        @app ||= App.new
      end

      def self.call env
        initialize!
        @app.call env
      end

    end
  end
end
