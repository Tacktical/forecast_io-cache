When /^I request '(.*)'$/ do |path|
  get path
end

Then /^I am given the json response.*$/ do |string|
  expect(parsed_response).to eq parsed(string)
end
