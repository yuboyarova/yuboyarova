Feature: The opening of the main page of the application
  Scenario: Home page
    When I am on the page of application
    Then I see menu on понедельник
    And history is empty
@close
  Scenario: Home page is working and it's impossible to make the empty order
    Given I am on the page of application
    When I push the button "Make order"
    Then I see a text Нельзя сделать пустой заказ!!!
    And The name of the tab is Расчет обедов в столовой СКБ "Контур"