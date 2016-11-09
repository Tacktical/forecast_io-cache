After do
  PGAdaptor.db.tables.each do |table|
    next if table == :schema_migrations
    PGAdaptor.db.execute "TRUNCATE #{table};"
  end
end
