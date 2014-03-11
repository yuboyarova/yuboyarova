Feature: Order complete set function

#TODO: Please rename feature name and runner
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
    Then The order sum must be 400 rubles


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
    Then The order sum must be 2572.95 rubles

  Scenario: Automatic reset of the selected dishes after is made the order
    When I select all item of all days in menu
    And I push the button "Make order"
    And I push the button "Make order"
    Then there will be a text "Нельзя сделать пустой заказ!!!"
    Then I see in history the following line: 'Понедельник, '<order time>' каша манная, яичница из двух яиц, шведский стол, плов. Вторник - салат "Цезарь", суп-пюре из брокколи, рагу из свинины, хлеб. Среда - каша пшенная, борщ, отбивная из курицы, пюре, хлеб. Четверг - салат "Непростой", щи, жаркое в горшочках, хлеб. Пятница - салат "Мистерия весны", лагман, бефстроганов, капуста жареная, хлеб. Суббота - каша кукурузная, яичница с ветчиной, суп "Всегда с тобой", хлеб. Воскресенье - цыпленок табака, тыква тушеная со свининой, рыбацкая уха, хлеб. Списано с личного счета 2572.95 р.'
    Then it isn't selected any item from the menu

  Scenario: Display of the current order value in case of the order of one item
    When I select the item "среда" in a dropdown menu
    When I select the 3 item in menu
    Then The order sum must be 250 rubles

  Scenario: Display of the current order value in case of the order of one item on one day
    When I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 2 item in menu
    And I select the 3 item in menu
    And I select the 4 item in menu
    And I select the 5 item in menu
    Then The order sum must be 271 rubles

  Scenario: Display of the current order value in case of the order of one item on all days
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
    Then The order sum must be 426.64 rubles


  Scenario: Display of the current order value in case of the order of two items on all days
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
    Then The order sum must be 1046.5 rubles

  @close
  #TODO: Please rename
  Scenario: When canceling all changes the made choice is cancelled
    When I select the 1 item in menu
    And I select the 2 item in menu
    And I press the button "Начать заново"
    Then it isn't selected any item from the menu
    And The order sum must be 0 rubles

