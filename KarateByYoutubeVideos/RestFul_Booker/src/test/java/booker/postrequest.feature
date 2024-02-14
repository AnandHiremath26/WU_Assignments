Feature: POST Restful Booker

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'

Scenario: Create a New Booking POST Request in single line
Given path '/booking'
And header Content-type = "application/json"
And request {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}
When method POST
Then status 200
And print response

  Scenario: Create a New Booking POST Request in Multiline
    Given path '/booking'
    And header Content-type = "application/json"
    And request
  """
  {
  "firstname": "Anand",
  "lastname": "Hiremath",
  "totalprice": 100,
  "depositpaid": true,
  "bookingdates":
  {
  "checkin": "2022-01-01",
  "checkout": "2022-01-10"
  },
  "additionalneeds": "Breakfast"
  }
   """
    When method POST
    Then status 200
    And print response

  Scenario: Create a New Booking POST Request using different file
    Given path '/booking'
    And header Content-type = "application/json"
    * def newBooking = read('payloads/NewBooking.json')
    And request newBooking
    When method POST
    Then status 200
    And print response

  Scenario Outline: Create a New Booking POST Request using data driven
    Given path '/booking'
    And header Content-type = "application/json"
    And request {"firstname": "#(fn)","lastname": "Hiremath","totalprice": #(price),"depositpaid": #(paid),"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}
    When method POST
    Then status 200
    And print response
    Examples:
      |fn       |price!|paid! |
      |Anand    |100   |true  |
      |Abhilash |150   |false |