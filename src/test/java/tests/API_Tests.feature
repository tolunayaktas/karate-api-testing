Feature: Simple CRUD API tests on Reqres site

  Scenario: Test a sample GET API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario: Test a sample POST API (Create User)
    Given url 'https://reqres.in/api/users'
    And request { "name": "John Doe", "job": "QA Engineer" }
    When method POST
    Then status 201
    And match response.name == "John Doe"
    And match response.job == "QA Engineer"
    And print response

  Scenario: Test a sample PUT API (Update User)
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "John Doe", "job": "Mid QA Engineer" }
    When method PUT
    Then status 200
    And match response.job == "Mid QA Engineer"
    And print response

  Scenario: Test a sample PATCH API (Partial Update User)
    Given url 'https://reqres.in/api/users/2'
    And request { "job": "Senior QA Engineer" }
    When method PATCH
    Then status 200
    And match response.job == "Senior QA Engineer"
    And print response

  Scenario: Test a sample DELETE API
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print 'User deleted successfully'
