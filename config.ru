require 'forecast_io-cache'

ForecastIO.configure do |config|
  config.api_key = ENV['API_KEY']
end

Forecast::IO::Cache.configure do |config|
  config.db_uri    = ENV['DATABASE_URL']
  config.radius    = ENV['RADIUS'].to_f
  config.timeframe = ENV['TIMEFRAME'].to_i
end
run Forecast::IO::Cache
