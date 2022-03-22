Feature: Parameters example

  Background:
    * def baseUrl = 'http://api.exchangeratesapi.io'
    * def spartanUrl = "http://44.201.154.37:8000"

  Scenario: basic test with status code validation
    Given url baseUrl
    And path "v1/latest"
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    When method GET
    Then status 200


  Scenario: basic test with status code validation
    Given url baseUrl
    And path "v1/2013-12-24"
    And param access_key = "eb9ebb657a5e03806fd2193a8d3034e2"
    When method GET
    Then status 200

  Scenario:
      Given url spartanUrl
      And path "api/spartans"
      And path 10
      And method GET
      Then status 200
      And match response == {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10}

  @wip
  Scenario:
    * def expectedSpartan = {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10}
    Given url spartanUrl
    And path "api/spartans"
    And path 10
    And method GET
    Then status 200
    And match response == expectedSpartan
