require 'json'
require 'sinatra/base'

module Forecast
  module IO
    module Cache
      class App < Sinatra::Base

        not_found do
          respond_as_json 404, status: 'Not Found', actions: actions
        end

        private

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
