require 'json'
require 'sinatra/base'

module Forecast
  module IO
    module Cache
      class App < Sinatra::Base
        LATITUDE = LONGITUDE = /(-?\d+(?:.\d+))/
        TIME = /(\d+)/

        get %r[/forecast/#{ENV['API_KEY']}/#{LATITUDE},#{LONGITUDE}(?:,#{TIME})?], provides: :json do |latitude,longitude,time|
          respond_as_json 200, Forecast.new.for(latitude, longitude, (time || current_timestamp))
        end

        not_found do
          respond_as_json 404, status: 'Not Found', actions: actions
        end

        private

          def current_timestamp
            Time.now.to_i
          end

          def respond_as_json code, body
            [code, { "Content-Type" => "application/json" }, JSON.dump(body) ]
          end

          def actions
            {
              forecast:         "/forecast/:key/:latitude,:longitude",
              forecast_at_time: "/forecast/:key/:latitude,:longitude,:time"
            }
          end

      end
    end
  end
end
