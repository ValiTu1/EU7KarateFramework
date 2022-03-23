Feature: Parameters example

  Background:
    * def baseUrl = 'http://api.exchangeratesapi.io'
    * def spartanUrl = "http://44.201.154.37:8000"
    * def hrUrl = "http://44.201.154.37:1000/ords/hr"

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

  Scenario:
    * def expectedSpartan = {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10}
    Given url spartanUrl
    And path "api/spartans"
    And path 10
    And method GET
    Then status 200
    And match response == expectedSpartan

  Scenario: query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param gender = "Female"
    And param nameContains = "j"
    When method get
    Then status 200
    And match header Content-Type == "application/json"
    And print response
    # verify each content has gender =  Female
    And match each response.content contains {"gender": "Female"}
    #second way of iteration
    And match each response.content[*].gender == "Female"
    And match response.content[0].name == "Jaimie"
    #verify each content phone is number
    And match each response.content contains {"phone" : "#number"}
    And match each response.content[*].phone == "#number"

  Scenario: hr regions example
    Given url hrUrl
    And path "regions"
    When method get
    Then status 200
    #And print response
    And match response.limit == 25
    And print each response.items.links


