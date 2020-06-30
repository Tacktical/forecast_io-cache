require 'forecast_io-cache'

ForecastIO.configure do |config|
  config.api_key = ENV['API_KEY']
end

Forecast::IO::Cache.configure do |config|
  config.radius = 1
  config.db_uri = 'postgres://localhost/forecast-test'
end
