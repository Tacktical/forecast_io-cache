require 'sinatra/base'

module Forecast
  module IO
    module Cache
      class App < Sinatra::Base

        not_found do
          [404,{ "Content-Type" => "application/json" }, JSON.dump( actions: actions )]
        end

        private
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
