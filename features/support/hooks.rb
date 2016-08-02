Before do
  @driver = Selenium::WebDriver.for :chrome
end


After do
  @driver.close
end



