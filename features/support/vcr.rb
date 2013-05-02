require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "./features/support/cassettes"
  c.hook_into :faraday
  c.allow_http_connections_when_no_cassette = false
end
