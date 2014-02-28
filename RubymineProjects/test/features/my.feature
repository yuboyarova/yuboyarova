Feature: Home page is working and it's impossible to make the empty order

  Scenario: The application has a home page
      Given I am on the page of application
      When I push the button "Make order"
      Then I see a text Нельзя сделать пустой заказ