require 'selenium-webdriver'


Given /^I am on the page of application$/ do
  @driver.get "http://kontur.ru/Files/userfiles/file/edu/Stagirovka%202012/test/default.html"
  @n_of_d=1
end

Then /^I see menu on (.*?)$/ do |day|
  word=@driver.find_element(:id,"days").text
  word[0..10].should==day
end

Then /^history is empty$/ do
  @driver.find_element(:id,"history").text.should==""
end

When /^I push the button "Make order"$/ do
  @driver.find_element(:id,"makeOrder").click()
end

Then /^I see a text (.*?)$/ do |text|
  @driver.find_element(:id,"validation").text.should==text
end

When /^The name of the tab is (.*?)$/ do |tab_name|
  @driver.title.should==tab_name
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
end