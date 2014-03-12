require 'selenium-webdriver'
require 'page-object/page_factory'
require 'page-object'


Given /^I am on the page of application$/ do
  @page = ApplicationPage.new(@driver, true)
  @n_of_d=1
end

Then /^I see menu on (.*?)$/ do |day|
  @page.days.should==day
end

Then /^history is empty$/ do
  @page.history.should==""
end

When /^I push the button "Make order"$/ do
  @page.make_order
end

Then /^I see a text (.*?)$/ do |text|
  @page.no.should==text
end

Then /^The name of the tab is (.*?)$/ do |tab_name|
  @page.title.should==tab_name
end