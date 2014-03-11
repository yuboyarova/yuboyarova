require 'selenium-webdriver'

Then /^The order sum must be (\d*.\d*) rubles$/ do |sum|
  @driver.find_element(:id,"orderSum").text.should==sum
end



Then /^there will be a text "(.*)"$/ do |text|
  @driver.find_element(:id,"validation").text.should==text

end

Then /^it isn't selected any item from the menu$/ do
  i=0
  j=0
  @select=Selenium::WebDriver::Support::Select.new(@driver.find_element(:id,"days"))
  for option in @select.options
    option.click()
    i+=1
    while j<4
      j+=1
      op='//*[@id="menu"]/div['+i.to_s+']/div['+j.to_s+']/input'
      k=@driver.find_element(:xpath, op).selected?
      k.should==false
    end
    if i==3 or i==5
      op='//*[@id="menu"]/div['+i.to_s+']/div['+5.to_s+']/input'
      k=@driver.find_element(:xpath, op).selected?
      k.should==false
    end
    j=0
  end
end