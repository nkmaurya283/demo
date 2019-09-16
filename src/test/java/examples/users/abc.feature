Feature: Demo for rest api using karate

  Background:
    * url 'https://reqres.in'

  Scenario: GET rest api example
   Given path '/api/users?page=2'
   When method get
   Then status 200


  Scenario: POST rest api example
    *  def user =
"""
{
   "name": "morpheus",
   "job": "leader"
    }
}
"""
    Given path 'api/users'
    And request user
    When method post
    Then status 201
    * def id = response.id
    * print 'created id is: ' + id

  Scenario: PUT rest api example
    *  def user =
"""
{
    "name": "morpheus",
    "job": "zion resident"
    }
}
"""
    Given path 'api/users/2'
    And request user
    When method put
    Then match response ==
  """
  {
   "name": "morpheus",
    "job": "zion resident",
    "updatedAt": #notnull
  }
  """