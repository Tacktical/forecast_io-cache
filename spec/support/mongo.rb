require 'mongo-configure'

Mongo::Configure.from_database 'forecast-test-spec'

RSpec.configure do |config|

  config.after :each, database: true do
    Mongo::Configure.current.load.collections.select { |c| c.name !~ /^system\./ }.each &:remove
  end

end
