require 'bson'

Forecast::IO::Cache.configure do |config|

  config.mongo_uri 'mongodb://localhost/forecast-test'

end
