require 'selenium-webdriver'
require 'rubygems'

Given /^I am on the page of application$/ do
  @driver = Selenium::WebDriver.for :firefox
  @driver.get "http://kontur.ru/Files/userfiles/file/edu/Stagirovka%202012/test/default.html"
end

When /^I push the button "Make order"$/ do
  @driver.find_element(:id,"makeOrder").click();
end

Then /^I see a text (.*?)$/ do |text|
 @driver.find_element(:id,"validation").text.include? "text"
 #element==text
 # Assert.assertTrue(selenium.isElementPresent("compose button"),"text")
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @driver.quit
end