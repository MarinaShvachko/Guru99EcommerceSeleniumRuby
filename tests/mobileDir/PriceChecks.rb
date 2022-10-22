require 'selenium-webdriver'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/tests/TestsSetUp.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MainPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MobilePage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/ProductDetailPage.rb'
require 'test/unit'

class PriceChecks < Test::Unit::TestCase
  BROWSER = 'firefox'.freeze

  def test_the_same_cost?
    driver = TestsSetUp.open_browser(BROWSER)
    driver.manage.window.maximize
    driver.manage.timeouts.implicit_wait = 5
    main_page = MainPage.new(driver)
    driver.get 'http://live.techpanda.org/index.php/'

    mobile_page = main_page.open_mobile_dir
    price_on_list_page = mobile_page.sony_xperia_price

    sony_xperia_page = mobile_page.open_sony_xperia_details
    price_on_product_page = sony_xperia_page.product_price

    assert_equal(price_on_list_page, price_on_product_page, 'Price of the product should be equal')

    TestsSetUp.tear_down

  end
end
