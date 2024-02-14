Feature: Hands On With Karate

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'

  Scenario: Calling javaScript functions
    * def jsFun = read('payloads/jfuctions.js')
    * def val = jsFun().printName()
    * print val
    * def val = jsFun().printName1("Aravind")
    * print val
    * def val = jsFun().printName2("Abhilash")
    * print val

  Scenario: PUT Update an Existing Booking
    Given path '/booking'
    And header Content-type = "application/json"
    And request {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}
    When method POST
    Then status 200
    And print response
    And match response =={"bookingid": "#ignore","booking": {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}}
    * def bID = response.bookingid
    * print bID

    Given path '/booking/'+bID
    And header Content-type = "application/json"
    And header Cookie = 'token=<token_value>'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And request {"firstname": "Aravind","lastname": "Hiremath","totalprice": 150,"depositpaid": false,"bookingdates": {"checkin": "2022-01-15","checkout": "2022-01-20"},"additionalneeds": "Wifi"}
    When method PUT
    Then status 200
    And print response
    And match response.firstname == 'Aravind'
    And match response.totalprice == 150

  Scenario: Delete a Booking
    Given path '/booking'
    And header Content-type = "application/json"
    And request {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}
    When method POST
    Then status 200
    And print response
    And match response =={"bookingid": "#ignore","booking": {"firstname": "Anand","lastname": "Hiremath","totalprice": 100,"depositpaid": true,"bookingdates": {"checkin": "2022-01-01","checkout": "2022-01-10"},"additionalneeds": "Breakfast"}}
    * def bID = response.bookingid
    * print bID

    Given path '/booking/'+bID
    And header Content-type = "application/json"
    And header Cookie = 'token=<token_value>'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method DELETE
    Then status 201