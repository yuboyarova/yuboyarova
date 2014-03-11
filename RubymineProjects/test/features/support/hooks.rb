require 'rspec/expectations'
require 'page-object/page_factory'
require 'selenium-webdriver'

World PageObject::PageFactory
browser = Selenium::WebDriver.for :firefox
app_page = ApplicationPage.new(browser, true)

Before  do
  @driver = browser
end

After ('@close') do
  @driver.close

end