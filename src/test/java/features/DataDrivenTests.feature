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



  Scenario: get user information verification(database vs API)
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, firstname,lastname, role from users where email = 'grhyme9@arstechnica.com';"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'Database result ', dbResult
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And header Accept = "application/json"
    And path "sign"
    And param email = "grhyme9@arstechnica.com"
    And param password = "gwennierhyme"
    When method GET
    Then status 200
    Then print response.accessToken
    * def authorizationToken = "Bearer " + response.accessToken
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And header Authorization = authorizationToken
    And path "api/users/me"
    When method get
    Then status 200
    And print response
    And match response.firstName == dbResult.firstname
    And match response.lastName == dbResult.lastname
    And match response.role == dbResult.role

  @wip
  Scenario Outline: get user information verification(database vs API)
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, firstname,lastname, role from users where email = '<email>';"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'Database result ', dbResult
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And header Accept = "application/json"
    And path "sign"
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    Then print response.accessToken
    * def authorizationToken = "Bearer " + response.accessToken
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And header Authorization = authorizationToken
    And path "api/users/me"
    When method get
    Then status 200
    And print response
    And match response.firstName == dbResult.firstname
    And match response.lastName == dbResult.lastname
    And match response.role == dbResult.role

    Examples:
    |read('data/users.csv')|




















