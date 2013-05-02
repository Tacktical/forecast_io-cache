module Parse

  def parsed string
    JSON.parse string
  end

  def parsed_response
    parsed last_response.body
  end

end
World Parse
