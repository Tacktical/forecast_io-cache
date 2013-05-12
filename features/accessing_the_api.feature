Feature: Accessing the api
  In order to provide information about the api
  When I access the root of the api I want to receive hypermedia information

  Scenario: Access /
    When I request '/'
    Then I am given the json response detailing the available actions:
      """
        {
          "actions":
          {
            "forecast":         "/forecast/:key/:latitude,:longitude",
            "forecast_at_time": "/forecast/:key/:latitude,:longitude,:time"
          }
        }
      """

  Scenario: Access an unkown page
    When I request '/un-known'
    Then I am given the json response detailing the available actions:
      """
        {
          "actions":
          {
            "forecast":         "/forecast/:key/:latitude,:longitude",
            "forecast_at_time": "/forecast/:key/:latitude,:longitude,:time"
          },
          "status": "Not Found"
        }
      """
