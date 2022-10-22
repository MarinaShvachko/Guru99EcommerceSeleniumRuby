require_relative 'BasePage'

class MobilePage < BasePage

  SORT_MENU = {css: 'select[title="Sort By"]'}
  SORT_BY_NAME = {xpath: "(//select//option[@value='http://live.techpanda.org/index.php/mobile.html?dir=asc&order=name'])[1]"}
  PRODUCT_NAMES = {css: ".product-name"}
  # find price also possible By.cssSelector("#product-price-1 > span.price")
  SONY_XPERIA_PRICE = {xpath: "//a[@title='Sony Xperia']/ancestor::h2//following::div[@class='price-box']"}
  SONY_XPERIA_TITLE = {css: "a[title='Sony Xperia']"}
  SONY_XPERIA_ADD_TO_CART = {xpath: "//a[@title='Sony Xperia']/ancestor::h2//following::button[1][@title='Add to Cart']"}
  ADD_COMPARE_SONY_XPERIA = {xpath: "//a[@title='Sony Xperia']/ancestor::h2//following::a[@class='link-compare'][1]"}
  ADD_COMPARE_IPHONE = {xpath: "//a[@title='IPhone']/ancestor::h2//following::a[@class='link-compare'][1]"}
  COMPARE_BTN = {xpath: "//button[@title='Compare']"}

  def open_sort_menu
    @driver.find_element(SORT_MENU).click
  end

  def sort_by_name
    @driver.find_element(SORT_BY_NAME).click
  end

  # def sort_by_name2
  #   drop = @driver.find_element(SORT_MENU)
  #   choose = Selenium::WebDriver::Support::Select.new(drop)
  #   choose.select_by(:text, "Name ")
  # end

  def sorted_by_name?
    array_names = @driver.find_elements(PRODUCT_NAMES)
    array_text_names = []

    array_names.each do |el|
      array_text_names.append(el.text)
    end
    array_text_names.eql?(array_text_names.sort)
  end

  def sony_xperia_price
    @driver.find_element(SONY_XPERIA_PRICE).text
  end

  def open_sony_xperia_details
    @driver.find_element(SONY_XPERIA_TITLE).click
    product_page = ProductDetailPage.new(@driver)
    return product_page
  end

  def sony_xperia_add_to_cart
    @driver.find_element(SONY_XPERIA_ADD_TO_CART).click
    shopping_cart = ShoppingCart.new(@driver)
    return shopping_cart
  end

  def add_phones_to_comparison
    add_to_compare(ADD_COMPARE_SONY_XPERIA)
    add_to_compare(ADD_COMPARE_IPHONE)
  end

  def click_compare
    @driver.find_element(COMPARE_BTN).click
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { @driver.window_handles.length == 2 }
    @driver.switch_to.window(@driver.window_handles.last)
    compare_page = CompareProductsPage.new(@driver)
    return compare_page
  end

end
