Feature: Check log in by the API

  Background:
    * url baseUrl
    * def configureHeaders = read('./headers/header.json')
    * def configureUsers = read('./data/users.json')
    * configure headers = configureHeaders['headersValid']

  @post
  Scenario: successful login
    Given path '/login'
    And request configureUsers['existing']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse contains 'Auth_token'

  @post
  Scenario: login with bad username
    Given path '/login'
    And request configureUsers['withBadUsername']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse.errorMessage contains 'User does not exist.'

  @post
  Scenario: login with bad password
    Given path '/login'
    And request configureUsers['withBadPassword']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse.errorMessage contains 'Wrong password.'

  @post
  Scenario: login with bad parameter
    Given path '/login'
    And request configureUsers['withBadParameter']
    When method POST
    Then status 200
    * def userResponse = response
    And match userResponse.errorMessage contains 'Bad parameter, missing username'