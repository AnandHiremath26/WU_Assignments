Feature: API Testing with Restful Booker

  Background: 
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'
    * def projectPath = karate.properties['user.dir']

  Scenario: Get Booking IDs
    Given path '/booking'
    When method GET
    Then status 200
    And print response

  Scenario: Get Booking Information
    Given path '/booking/1'
    When method GET
    Then status 200
    And print response

  Scenario: POST Create a New Booking
    Given path '/booking'
    And header Content-type = "application/json"
    And request {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}
    When method POST
    Then status 200
    And print response
    * def BookingID = Java.type('features.BookingID')
    * def bId = new BookingID()
    * def bookingIdFromResponse = response.bookingid
    * karate.log('Type of bookingIdFromResponse:', karate.typeOf(bookingIdFromResponse))
    * karate.log('Value of bookingIdFromResponse:', bookingIdFromResponse)
    * def bookingIdAsString = bookingIdFromResponse
    * bId.setBookingID(karate.toJava(bookingIdAsString))
    * def actualBookingId = bId.getBookingID()
    * print actualBookingId
    * karate.log('Booking ID:', bId.getBookingID())
