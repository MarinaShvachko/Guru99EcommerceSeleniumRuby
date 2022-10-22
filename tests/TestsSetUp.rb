require 'selenium-webdriver'

class TestsSetUp

  def self.open_browser(browser)
    if browser.downcase.eql? 'firefox'
      @driver = Selenium::WebDriver.for :firefox
    else
      raise Exception, 'Please, specify browser as \"firefox\"'
    end
  end

  def self.tear_down
    @driver.quit
  end

end
