When /^I request '(.*)'$/ do |path|
  @path = path
end

Then /^I am given the json response.*$/ do |string|
  get @path
  expect(parsed_response).to eq parsed(string)
end
