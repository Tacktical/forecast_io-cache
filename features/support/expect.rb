module Expectation

  def expect_ok
    yield
    expect(last_response.status).to eq 200
  end

end
World Expectation
