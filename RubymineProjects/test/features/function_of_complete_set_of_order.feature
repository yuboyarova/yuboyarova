Feature: Function of a complete set of the order

Background:
  Given I am on the page of application

  Scenario: Display of the current order value
    When I select the 2 item in menu
    When I select the 4 item in menu
    Then The order sum must be 220 rubles

  Scenario: The correct display of an order value in case of the order not some days forward.
    When I select the 4 item in menu
    When I select the item "среда" in a dropdown menu
    When I select the 3 item in menu
    When I select the item "понедельник" in a dropdown menu
    Then The order sum must be 150 rubles


  Scenario: Correctness of canceling of the made choice of menu items.
    When I select the item "вторник" in a dropdown menu
    And I select the 1 item in menu
    And I select the 2 item in menu
    And I select the 3 item in menu
    And I select the 4 item in menu
    Then The order sum must be 463.54 rubles
    When I select the 4 item in menu
    And I select the 1 item in menu
    And I select the 3 item in menu
    And I select the 2 item in menu
    Then The order sum must be 0 rubles

  Scenario: Choice as all dishes and any of them irrespective of a day of the week
    When I select all item of all days in menu
    Then The order sum must be 301 rubles

  Scenario: Choice as all dishes and any of them irrespective of a day of the week
    When I select all item of all days in menu
    And I push the button "Make order"
    And I push the button "Make order"
    Then there will be a text "Нельзя сделать пустой заказ!!!"
    #Then In the history there shall be only one record
    Then it isn't selected any item from the menu

  Scenario: Display of the current order value in case of the order of one item
    When I select the item "среда" in a dropdown menu
    When I select the 3 item in menu
    Then The order sum must be 250 rubles

  Scenario: Display of the current order value in case of the order of one item
    When I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 2 item in menu
    And I select the 3 item in menu
    And I select the 4 item in menu
    And I select the 5 item in menu
    Then The order sum must be 271 rubles

  Scenario: When canceling all changes or in case of the beginning of new session the made choice is cancelled
    When I select the 1 item in menu
    And I select the 2 item in menu
    And I press the button "Начать заново"
    Then it isn't selected any item from the menu
    And The order sum must be 0 rubles


  Scenario: Display of the current order value in case of the order of one item
    When I select the 1 item in menu
    And I select the item "вторник" in a dropdown menu
    And I select the 1 item in menu
    And I select the item "среда" in a dropdown menu
    And I select the 1 item in menu
    And I select the item "четверг" in a dropdown menu
    And I select the 1 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the item "суббота" in a dropdown menu
    And I select the 1 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 1 item in menu
    Then The order sum must be 80 rubles


  Scenario: Display of the current order value in case of the order of one item
    When I select the 1 item in menu
    And I select the 4 item in menu
    And I select the item "вторник" in a dropdown menu
    And I select the 2 item in menu
    And I select the 4 item in menu
    And I select the item "среда" in a dropdown menu
    And I select the 3 item in menu
    And I select the 5 item in menu
    And I select the item "четверг" in a dropdown menu
    And I select the 3 item in menu
    And I select the 4 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 4 item in menu
    And I select the 5 item in menu
    And I select the item "суббота" in a dropdown menu
    And I select the 3 item in menu
    And I select the 1 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 2 item in menu
    And I select the 4 item in menu
    Then The order sum must be 71 rubles

  @close
  Scenario: When canceling all changes or in case of the beginning of new session the made choice is cancelled
    When I select the 1 item in menu
    And I select the 2 item in menu
    And I press the button "Начать заново"
    Then it isn't selected any item from the menu
    And The order sum must be 0 rubles

