Feature: History of orders

  Background:
    Given I am on the page of application


  Scenario: Tracing by history of orders of empty orders
    When I push the button "Make order"
    Then history is empty


  Scenario: The correct display of the order consisting of several line items
    When I select the item "суббота" in a dropdown menu
    And I select the 3 item in menu
    And I select the 1 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"суббота, "<order time>" каша кукурузная, суп 'всегда с тобой'. Списано с личного счета 111 р."

  @close
  Scenario: The correct display of the order consisting of one line item.
    When I select the item "четверг" in a dropdown menu
    And I select the 1 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"четверг, "<order time>" салат 'не простой'. Списано с личного счета 0 р."

  Scenario: The correct display of the order consisting of several line items from the menu on different days of the week
    When I select the item "воскресенье" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"пятница, "<order time>" салат мистерия весны, капуста жареная. Списано с личного счета 210 р."

  Scenario: Order time in the history shall match time of application in which the order was made
    When I select the item "вторник" in a dropdown menu
    And I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"вторник, "<order time>" суп-пюре из брокколи. Списано с личного счета 80 р."
    And Time of clicking of the button shall match <order time> in the history

  Scenario: Choice of all items of the menu for one day
    When I select the item "воскресенье" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I select the 3 item in menu
    And I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"воскресенье, "<order time>" цыпленой табака, тыква тушеная со свининой, рыбацкая уха, хлеб. Списано с личного счета 251 р."


  Scenario: Choice of all items of the menu for all days
    When I select all item of all days in menu
    And I push the button "Make order"
    Then I see in history the following line:"воскресенье, "<order time>" цыпленой табака, тыква тушеная со свининой, рыбацкая уха, хлеб. Списано с личного счета 2523 р."

  Scenario: Select on one item from the menu for all days
    When I select the 1 item in menu
    And I select the item "вторник" in a dropdown menu
    And I select the 2 item in menu
    And I select the item "среда" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "четверг" in a dropdown menu
    And I select the 4 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 5 item in menu
    And I select the item "суббота" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line:"воскресенье, "<order time>" тыква тушеная со свининой. Списано с личного счета 565 р."

  Scenario: History cleaning
    When I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 3 item in menu
    And I push the button "Make order"
    And I press the button "Начать заново"
    Then history is empty

  