require 'forecast_io-cache'
require 'rack/test'

module API
  include Rack::Test::Methods

  def app
    Forecast::IO::Cache
  end

end

World API
