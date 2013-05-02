require 'forecast_io-cache'

Forecast::IO.configure do |config|
  config.api_key = ENV['API_KEY']
end

Forecast::IO::Cache.configure do |config|
  config.mongo_uri ENV['MONGOHQ_URL']
end
run Forecast::IO::Cache
