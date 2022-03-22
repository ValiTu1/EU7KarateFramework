Feature: exchange rate api tests

  Scenario: basic test with status code validation
    Given url 'http://api.exchangeratesapi.io/v1/latest'
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    When method GET
    Then status 200

  Scenario: get rates for specific date
    Given url "http://api.exchangeratesapi.io/v1/2013-12-24"
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    When method GET
    Then status 200

  Scenario:
    Given url "http://api.exchangeratesapi.io/v1/2013-12-24"
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    When method GET
    Then status 200
    And match header Content-Type == "application/json; Charset=UTF-8"
    And match header Transfer-Encoding == "chunked"
    And match header Connection == "keep-alive"
    #to verify headers we use header keyword then headername without double or single quotes
    # and == "header value"
    And match header Date == "#present"
    #this is equal to headers().hasHeaderWithName("headername") in RestAssured

  Scenario: json body verification
    Given url "http://api.exchangeratesapi.io/v1/2013-12-24"
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    And param base = "EUR"
    When method GET
    Then status 200
    And match header Content-Type == "application/json; Charset=UTF-8"
    And match response.base == "EUR"
    And match response.rates.USD == "#present"
    And match response.rates.USD == 1.367761

