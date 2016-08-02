require 'selenium-webdriver'
require_relative '../modules/constants'

class DefaultPage
  include Constants
  def initialize(driver, page_url)
    @page_driver = driver
    @page_url = page_url
  end

  def get_driver
    @page_driver
  end

  def get_url
    @page_url
  end

  def go_to
    @page_driver.navigate.to @page_url
  end

  def displayed?(locator)
    @page_driver.find_element(locator).displayed?
    true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
  end

  def wait_for_ajax(timeout=SHORT_WAIT)
    loop do
      sleep 1
      break if @page_driver.execute_script('return jQuery.active == 0')
      raise "Wait for AJAX timed out after waiting for #{timeout} seconds"
    end
  end

  def wait_for_view(view_wrapper)
    wait = Selenium::WebDriver::Wait.new(timeout: STANDARD_WAIT)
    wait.until do
      @page_driver.find_element(view_wrapper.keys[0] => view_wrapper.values[0])
    end
  end

  def close
    @page_driver.close
  end

  private

end