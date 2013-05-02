require 'forecast_io'
require "forecast_io/cache/version"
require "forecast_io/cache/configuration"
require "forecast_io/cache/forecast"
require "forecast_io/cache/store"
require "forecast_io/cache/generate"
require "forecast_io/cache/app"

module Forecast
  module IO
    module Cache

      def self.configure
        yield configuration
      end
      def self.configuration
        @config ||= Configuration.new
      end


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
