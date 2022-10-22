require 'selenium-webdriver'

class BasePage

  def initialize(driver)
    @driver = driver
  end

  def get_title
    @driver.title
  end

  def add_to_compare(el)
    @driver.find_element(el).click
  end

  def how_many_pages_opened?
    return @driver.window_handles.length
  end

end
