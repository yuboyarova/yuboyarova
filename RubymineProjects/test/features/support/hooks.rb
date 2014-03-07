require 'rspec/expectations'
require 'page-object/page_factory'
require 'selenium-webdriver'

World PageObject::PageFactory
browser = Selenium::WebDriver.for :firefox

Before  do
 @driver = browser
end

After ('@close') do
    @driver.close

end