Feature: BookIt Api Tests

  Background:
    * def baseUrl = "https://cybertek-reservation-api-qa3.herokuapp.com/"
    #point another feature file
    * def AuthFeature = call read('classpath:features/BookitAuth.feature')
    * def accessToken = AuthFeature.authorizationToken
    * print 'Token From Background', accessToken

    Scenario: get user information
      Given url baseUrl
      And header Authorization = accessToken
      And path "api/users/me"
      When method get
      Then status 200
      And print response
      And match response ==
    """
      {
  "firstName": "Cecil",
  "lastName": "Nacey",
  "role": "student-team-leader",
  "id": 93
  }
      """

  Scenario: get campus information
    Given url baseUrl
    And path "api/campuses"
    And header Authorization = accessToken
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    # read the campuses.json file in the data directory
    And def expectedCampuses = read ('classpath:data/campuses.json')
    And match response == expectedCampuses

