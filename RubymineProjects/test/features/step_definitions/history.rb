require 'selenium-webdriver'

When /^I select the item "(.*)" in a dropdown menu$/ do |day|
  @select=Selenium::WebDriver::Support::Select.new(@driver.find_element(:id,"days"))
  for option in @select.options
    if option.text == day
      option.click()
    end
  end
  @n_of_d+=1
end

When /^I select the ([1-5]) item in menu$/ do |item|
  op='//*[@id="menu"]/div['+@n_of_d.to_s+']/div['+item+']/input'
  @driver.find_element(:xpath, op).click()
end

Then /^I see in history the following line: '(.*)'<order time>'(.*)'$/ do |item1, item2|
  el=@driver.find_element(:id,"history").text
  t0=Time.new().strftime("%I:%M:%S %p:")
  el.should==(item1+t0+item2)
end

Then /^Time of clicking of the button shall match <order time> in the history$/ do
  t0=(Time.new()+2).strftime("%I:%M:%S %p:")
  el=@driver.find_element(:id,"history").text
  @el[9..20].should==t0
end

When /^I select all item of all days in menu$/ do
  i=0
  j=0
  @select=Selenium::WebDriver::Support::Select.new(@driver.find_element(:id,"days"))
  for option in @select.options
    option.click()
    i+=1
    while j<4
      j+=1
      op='//*[@id="menu"]/div['+i.to_s+']/div['+j.to_s+']/input'
      @driver.find_element(:xpath, op).click()
    end
    if i==3 or i==5
      op='//*[@id="menu"]/div['+i.to_s+']/div['+5.to_s+']/input'
      @driver.find_element(:xpath, op).click()
    end
    j=0
  end
end