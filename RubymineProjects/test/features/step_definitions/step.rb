require 'selenium-webdriver'


Given /^I am on the page of application$/ do
    @driver.get "http://kontur.ru/Files/userfiles/file/edu/Stagirovka%202012/test/default.html"
    @n_of_d=1
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

Then /^I see menu on (.*?)$/ do |day|
    word=@driver.find_element(:id,"days").text
    word[0..10].should==day
end

Then /^history is empty$/ do
    @driver.find_element(:id,"history").text.should==""
end

When /^I click on the dropdown menu$/ do
    @driver.find_element(:id,"days").click()
end

Then /^I see all days of the week:(.*?)$/ do |week|
    word=@driver.find_element(:id,"days").text
    word.gsub!(/\n/,", ")
    word.should==week
end

When /^I select the item "(.*)" in a dropdown menu$/ do |day|
    @select=Selenium::WebDriver::Support::Select.new(@driver.find_element(:id,"days"))
    for option in @select.options
      if option.text == day
          option.click()
      end
    end
    @n_of_d+=1
end

Then /^I see the menu:(.*?)$/ do |menu|
    word= @driver.find_element(:id,"menu").text
    word.gsub!(/\n/,", ")
    word.should==menu
end

When /^I press the button "Tab" two times, press Enter and select Tuesday by means of arrows on the keypad$/ do
    reopen = @driver.find_element(:id, "days")
    @driver.action.send_keys(reopen, :tab).send_keys(reopen, :return).send_keys(reopen, :arrow_down).send_keys(reopen, :return).perform
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

When /^I press the button "(.*)"$/ do |op|
    @driver.find_element(:link, op).click()
end

Then /^The order sum must be (\d*.\d*) rubles$/ do |sum|
    @driver.find_element(:id,"orderSum").text.should==sum
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



Then /^Time of clicking of the button shall match <order time> in the history$/ do
     t0=(Time.new()+2).strftime("%I:%M:%S %p:")
     el=@driver.find_element(:id,"history").text
     @el[9..20].should==t0
end