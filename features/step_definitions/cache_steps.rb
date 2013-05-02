Given "I have cached this forecast recently" do
  @position = [151.238823,-33.857444]
  setup "position" => @position, "time" => 123456789
end

Given "I have a cache result nearby" do
  @position = [151.238823,-33.857333]
  setup "position" => @position, "time" => 123456789
end

Given "I have a cache result for close by" do
  @position = [151.238823,-33.957333]
  setup "position" => @position, "time" => 123456789
end

Given "I have a cached result but for a time beyond the threshold" do
  setup "position" => [151.238823,-33.757444], "time" => 1234567890
end
