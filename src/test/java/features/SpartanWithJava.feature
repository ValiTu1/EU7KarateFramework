Feature: Karate Java Integration


  Background:
    * def spartanUrl = "http://44.201.154.37:8000"

  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response

  Scenario: Create a  new spartan

    Given url spartanUrl
    And path "api/spartans"
    And header Accept = "application/json"
    And header Content-Type = "application/json"
    And request
  """
    {
        "name": "Meade",
        "gender": "Male",
        "phone": 3584128232
    }
    """
    When method post
    And print response

  @wip
  Scenario: reading java methods
      #point the class that we want to run
    #Java.type --> used to connect to java class
      * def SpartanDataGenerator = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan = SpartanDataGenerator.createSpartan()
    #run the static method in that class and capture the result
    #the return map object is represent as a json
      * print newSpartan

