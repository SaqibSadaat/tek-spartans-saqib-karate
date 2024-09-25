Feature: Testing Plan Code section

  @PlanCode_1
  Scenario: Testing endpoint /api/plans/get-all-plan-code
    Given url BASE_URL
    Given path "/api/token"
    Given request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then print response
    # This prints the response received from the server after the POST request.
    # Useful for debugging and verifying the response content.

    Then status 200
    * def token = response.token
    # This extracts the token from the JSON response and assigns it to the variable `token`.
    # The token will be used for authenticating subsequent requests.

    Given path "/api/plans/get-all-plan-code"
    # This sets the path for the next API request to "/api/plans/get-all-plan-code", the endpoint for retrieving all plan codes.

    Given header Authorization = "Bearer " + token
    # This sets the Authorization header for the request. It appends the token retrieved earlier to the string "Bearer ".
    # This is necessary to authenticate the request.

    When method get
    # This sends a GET request to the "/api/plans/get-all-plan-code" endpoint.

    Then print response
    # This prints the response from the GET request. It helps you verify if the correct data has been returned.

    Then status 200
    Then assert response[0].planExpired == false
    Then assert response[1].planExpired == false
    Then assert response[2].planExpired == false
    Then assert response[3].planExpired == false
    # These lines assert that the `planExpired` field is `false` for the first four items in the response array.
    # It ensures that none of the first four plans have expired.

    Then assert response[0].createdBy == "SYSTEM"
    Then assert response[1].createdBy == "SYSTEM"
    Then assert response[2].createdBy == "SYSTEM"
    Then assert response[3].createdBy == "SYSTEM"
    # These lines assert that the `createdBy` field for the first four items in the response array is "SYSTEM".
    # This ensures that these plans were created by the system.

    #The test authenticates with the API by sending a POST request to obtain a token.
    #It then uses the token to send a GET request to retrieve all plan codes.
    #Finally, it checks if the first plan's planExpired field is false and that it was created by the SYSTEM.