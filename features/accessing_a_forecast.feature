Feature: Accessing a forecast
  In order to provide weather information to my users
  I want to access a forecast for a specific location

  Scenario: Not cached
    When I request '/forecast/API_KEY/-33.857444,151.238823'
    Then I am given the forecast as returned from forecast.io

  Scenario: Cached
    Given I have cached this forecast recently
    When I request '/forecast/API_KEY/-33.857444,151.238823'
    Then I am given the cached forecast

  Scenario: Cached nearby
    Given I have a cache result nearby
    When I request '/forecast/API_KEY/-33.857444,151.238823'
    Then I am given the cached forecast

  Scenario: Cached close but beyond radius
    Given I have a cache result for close by
    When I request '/forecast/API_KEY/-33.857444,151.238823'
    Then I am given the forecast as returned from forecast.io

  Scenario: Cache expired
    Given I have a cached result but for a time beyond the threshold
    When I request '/forecast/API_KEY/-33.857444,151.238823'
    Then I am given the forecast as returned from forecast.io
