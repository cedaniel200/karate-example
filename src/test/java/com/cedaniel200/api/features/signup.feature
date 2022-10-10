Feature: Check sign up by the API

  Background:
    * url baseUrl
    * def configureHeaders = read('./headers/header.json')
    * def configureUsers = read('./data/users.json')
    * configure headers = configureHeaders['headersValid']

  @post
  Scenario: successful sign up
    * def javaFuncUsernameRandom = Java.type('com.cedaniel200.api.utils.UsernameRandom')
    * def usernameRandom = new javaFuncUsernameRandom()
    * def username = usernameRandom.create()
    Given path '/signup'
    And request { "username": #(username), "password": "1234567890" }
    When method POST
    Then status 200
    * string userResponse = response
    And match userResponse !contains 'errorMessage'

  @post
  Scenario: sign up with existing user
    Given path '/signup'
    And request configureUsers['existing']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse.errorMessage contains 'This user already exist.'

  @post
  Scenario: sign up with bad parameter
    Given path '/signup'
    And request configureUsers['withBadParameter']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse.errorMessage contains 'Bad parameter, missing username or password'