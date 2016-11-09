require 'pg_adaptor'
PGAdaptor.db = Sequel.connect 'postgres://localhost/forecast-test'

RSpec.configure do |config|

  config.after :example, database: true do
    PGAdaptor.db.tables.each do |table|
      next if table == :schema_migrations
      PGAdaptor.db.execute "TRUNCATE #{table};"
    end
  end

end
