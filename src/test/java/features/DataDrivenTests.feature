Feature: Dara Driven Tests

  Background:
    * def bookItUrl = "https://cybertek-reservation-api-qa3.herokuapp.com"


  Scenario Outline: get token for different user <email>
    Given url bookItUrl
    And header Accept = "application/json"
    And path "sign"
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    Then print response.accessToken
    * def authorizationToken = "Bearer " + response.accessToken
    Then print authorizationToken

    Examples:
  | email               | password     |
  | mcossor8l@webmd.com | cecilnacey   |
  | mstacey8r@imdb.com  | skylargiblin |

  Scenario Outline: get token for different user <email>
    Given url bookItUrl
    And header Accept = "application/json"
    And path "sign"
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    Then print response.accessToken
    * def authorizationToken = "Bearer " + response.accessToken
    Then print authorizationToken

    Examples:
  |read('data/users.csv')|


  @wip
  Scenario: get user information verification(database vs API)


