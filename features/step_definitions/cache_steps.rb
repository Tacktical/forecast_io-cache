Given "I have cached this forecast recently" do
  @latitude = -33.857444
  @longitude = 151.238823
  setup "latitude" => @latitude, "longitude" => @longitude, "time" => 123456789
end

Given "I have a cache result nearby" do
  @latitude = -33.857333
  @longitude = 151.238823
  setup "latitude" => @latitude, "longitude" => @longitude, "time" => 123456789
end

Given "I have a cache result for close by" do
  @latitude = -33.957333
  @longitude = 151.238823
  setup "latitude" => @latitude, "longitude" => @longitude, "time" => 123456789
end

Given "I have a cached result but for a time beyond the threshold" do
  setup "latitude" => -33.757444, "longitude" => 151.238823, "time" => 1234567890
end
