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
    Then status 200

  #Send request to /api/token
  #With invalid username valid password
  #Expected status 404

  @US_2
  Scenario: Valid token with invalid credentials
    Given request
    """
      {
          "username": "Xsupervisor",
          "password": "tek_supervisor"
      }
    """
    When method post
    Then status 404
  