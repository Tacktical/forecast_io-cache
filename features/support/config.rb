require 'bson'

Forecast::IO.configure do |config|
  config.api_key = ENV['API_KEY']
end

Forecast::IO::Cache.configure do |config|
  config.mongo_uri 'mongodb://localhost/forecast-test'
end
