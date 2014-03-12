require 'selenium-webdriver'

When /^I click on the dropdown menu$/ do
  @driver.find_element(:id,"days").click()
end

Then /^I see all days of the week:(.*)$/ do |week|
  @page.days_options.should==week
end

Then /^I see the menu:(.*?)$/ do |menu|
  @page.menu.gsub!(/\n/,", ").should==menu
end

When /^I press the button "Tab" two times, press Enter and select Tuesday by means of arrows on the keypad$/ do
  reopen = @driver.find_element(:id, "days")
  @driver.action.send_keys(reopen, :tab).send_keys(reopen, :return).send_keys(reopen, :arrow_down).send_keys(reopen, :return).perform
end

When /^I press the button "(.*)"$/ do |op|
  @page.default_page
end