Feature: get user token
  
  Background: 
    * def bookItUrl = "https://cybertek-reservation-api-qa3.herokuapp.com"


  Scenario: get one user token
    Given url bookItUrl
    And header Accept = "application/json"
    And path "sign"
    And param email = "mcossor8l@webmd.com"
    And param password = "cecilnacey"
    When method GET
    Then status 200
    Then print response.accessToken
    * def authorizationToken = "Bearer " + response.accessToken
    Then print authorizationToken
    