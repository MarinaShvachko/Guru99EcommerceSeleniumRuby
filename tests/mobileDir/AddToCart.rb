require 'selenium-webdriver'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/tests/TestsSetUp.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MainPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MobilePage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/ShoppingCart.rb'
require 'test/unit'

#TODO add parameters what phones should be added
class AddToCart < Test::Unit::TestCase
  BROWSER = 'firefox'.freeze
  MAX_NUM_EXPECTED_TXT = "* The maximum quantity allowed for purchase is 500." # The requested quantity for "Sony Xperia" is not available
  CART_EMPTY_EXPECTED_TXT = "SHOPPING CART IS EMPTY"

  def test_add_to_cart_more_then_available
    driver = TestsSetUp.open_browser(BROWSER)
    driver.manage.window.maximize
    driver.manage.timeouts.implicit_wait = 5
    main_page = MainPage.new(driver)
    driver.get 'http://live.techpanda.org/index.php/'

    mobile_page = main_page.open_mobile_dir
    shopping_cart = mobile_page.sony_xperia_add_to_cart
    shopping_cart.change_quantity(1000)
    shopping_cart.click_update_qty
    actual_error_txt = shopping_cart.get_err_qty_msg_txt

    assert_equal(MAX_NUM_EXPECTED_TXT, actual_error_txt)

    shopping_cart.empty_cart
    empty_card_txt = shopping_cart.is_cart_empty?

    assert_equal(CART_EMPTY_EXPECTED_TXT, empty_card_txt)

    TestsSetUp.tear_down

  end
end
