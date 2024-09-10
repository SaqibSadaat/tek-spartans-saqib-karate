@Regression
Feature: API testing for Security Functions

  Background:
    Given url 'https://dev.insurance-api.tekschool-students.com'
    Given path '/api/token'

  @US_1
  Scenario: Valid token with valid credentials
    Given request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then print response
    Then assert response.username == "supervisor"
    Then status 200

  #Send request to /api/token
  #With invalid username valid password
  #Expected status 404
  @US_2
  Scenario Outline: Valid token with invalid credentials
    Given request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method post
    Then print response
    Then status <statusCode>
    Then assert response.errorMessage == "<error>"

    Examples:
      | username      | password       | statusCode | error                        |
      | wrongUsername | tek_supervisor | 404        | User wrongUsername not found |
      | supervisor    | wrong password | 400        | Password not matched         |