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
    Then I see in history the following line: 'Суббота, '<order time>' каша кукурузная, суп "Всегда с тобой". Списано с личного счета 161.11 р.'


  Scenario: The correct display of the order consisting of one line item.
    When I select the item "четверг" in a dropdown menu
    And I select the 1 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Четверг, '<order time>' салат "Непростой". Списано с личного счета 50 р.'

  Scenario: The correct display of the order consisting of several line items from the menu on different days of the week
    When I select the item "воскресенье" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Пятница, '<order time>' салат "Мистерия весны", капуста жареная. Списано с личного счета 260 р.'

  Scenario: Order time in the history shall match time of application in which the order was made
    When I select the item "вторник" in a dropdown menu
    And I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Вторник, '<order time>' суп-пюре из брокколи. Списано с личного счета 130 р.'
    And Time of clicking of the button shall match <order time> in the history

  Scenario: Choice of all items of the menu for one day
    When I select the item "воскресенье" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I select the 3 item in menu
    And I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Воскресенье, '<order time>' цыпленок табака, тыква тушеная со свининой, рыбацкая уха, хлеб. Списано с личного счета 301 р.'


  Scenario: Choice of all items of the menu for all days
    When I select all item of all days in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Понедельник, '<order time>' каша манная, яичница из двух яиц, шведский стол, плов. Вторник - салат "Цезарь", суп-пюре из брокколи, рагу из свинины, хлеб. Среда - каша пшенная, борщ, отбивная из курицы, пюре, хлеб. Четверг - салат "Непростой", щи, жаркое в горшочках, хлеб. Пятница - салат "Мистерия весны", лагман, бефстроганов, капуста жареная, хлеб. Суббота - каша кукурузная, яичница с ветчиной, суп "Всегда с тобой", хлеб. Воскресенье - цыпленок табака, тыква тушеная со свининой, рыбацкая уха, хлеб. Списано с личного счета 2572.95 р.'


  Scenario: Select on one item from the menu for all days
    When I select the 1 item in menu
    And I select the item "вторник" in a dropdown menu
    And I select the 2 item in menu
    And I select the item "среда" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "четверг" in a dropdown menu
    And I select the 3 item in menu
    And I select the item "пятница" in a dropdown menu
    And I select the 4 item in menu
    And I select the item "суббота" in a dropdown menu
    And I select the 4 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 1 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Понедельник, '<order time>' каша манная. Вторник - суп-пюре из брокколи. Среда - отбивная из курицы. Четверг - жаркое в горшочках. Пятница - капуста жареная. Суббота - хлеб. Воскресенье - цыпленок табака. Списано с личного счета 613.1 р.'

@close
  Scenario: History cleaning
    When I select the item "пятница" in a dropdown menu
    And I select the 1 item in menu
    And I select the 4 item in menu
    And I select the item "воскресенье" in a dropdown menu
    And I select the 3 item in menu
    And I push the button "Make order"
    And I press the button "Начать заново"
    Then history is empty



