Feature: Menu choice on days

  Background:
    Given I am on the page of application


  Scenario: To check a correctness of display of days of the week and absence of excess lines in a dropdown menu.
    When I click on the dropdown menu
    Then I see all days of the week:["понедельник", "вторник", "среда", "четверг", "пятница", "суббота", "воскресенье"]


  Scenario: Check of compliance of the menu to a day of the week.
     When I select the item "суббота" in a dropdown menu
     Then I see the menu:Каша кукурузная 50 р., Яичница с ветчиной 69.9 р., Суп "Всегда с тобой" 111.11 р., Хлеб 1 р.
     And I select the item "вторник" in a dropdown menu
     Then I see the menu:Салат "Цезарь" 82.54 р., Суп-пюре из брокколи 130 р., Рагу из свинины 250 р., Хлеб 1 р.
     And I select the item "суббота" in a dropdown menu
     Then I see the menu:Каша кукурузная 50 р., Яичница с ветчиной 69.9 р., Суп "Всегда с тобой" 111.11 р., Хлеб 1 р.


  Scenario: Choice of a day of the week by means of the keypad.
    When I press the button "Tab" two times, press Enter and select Tuesday by means of arrows on the keypad
    Then I see the menu:Салат "Цезарь" 82.54 р., Суп-пюре из брокколи 130 р., Рагу из свинины 250 р., Хлеб 1 р.


  Scenario: When canceling all changes or in case of the beginning of new session the main page opens.
    When I select the item "суббота" in a dropdown menu
    And I press the button "Начать заново"
    Then I see menu on понедельник
    And history is empty
  @close


  Scenario: History of orders is correctly displayed
    When I select the 2 item in menu
    And I push the button "Make order"
    Then I see in history the following line: 'Понедельник, '<order time>' яичница из двух яиц. Списано с личного счета 70 р.'