module Parse

  def parsed string
    JSON.parse string
  rescue JSON::ParserError
    raise "Expected [#{string}] to be valid json"
  end

  def parsed_response
    parsed last_response.body
  end

end
World Parse
