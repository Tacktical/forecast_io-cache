Sequel.migration do
  up do
    execute <<-SQL
      CREATE EXTENSION cube;
      CREATE EXTENSION earthdistance;
    SQL
    create_table(:forecasts) do
      column :time,         Integer, null: false
      column :latitude,     Float,   null: false
      column :longitude,    Float,   null: false
      column :wind_speed,   Float
      column :wind_bearing, Float
      column :humidity,     Float
      column :pressure,     Float
      column :visibility,   Float
      column :temperature,  Float
    end
    execute <<-SQL
      CREATE INDEX forecast_lookup ON forecasts USING gist(ll_to_earth(latitude, longitude));
    SQL
  end
end
