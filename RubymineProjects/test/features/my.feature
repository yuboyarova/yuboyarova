Feature: History of orders

  Background:
    Given I am on the page of application

#@close

Scenario: History cleaning
  When I select the item "пятница" in a dropdown menu
  And I select the 1 item in menu
  And I select the 4 item in menu
  And I select the item "воскресенье" in a dropdown menu
  And I select the 3 item in menu
  And I push the button "Make order"
  And I press the button "Начать заново"
  Then history is empty
