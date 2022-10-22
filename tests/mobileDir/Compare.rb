require 'selenium-webdriver'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/tests/TestsSetUp.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MainPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MobilePage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/ShoppingCart.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/CompareProductsPage.rb'
require 'test/unit'

#TODO add parameters what phones should be compared
class Compare < Test::Unit::TestCase
  BROWSER = 'firefox'.freeze
  EXPECT_COMP_PAGE_HEADING = 'COMPARE PRODUCTS'
  EXPECT_PHONE_NAMES = ["SONY XPERIA", "IPHONE"]
  EXPECT_NUM_OPENED_PAGES = 1

  def test_compare_products
    driver = TestsSetUp.open_browser(BROWSER)
    driver.manage.window.maximize
    driver.manage.timeouts.implicit_wait = 5
    main_page = MainPage.new(driver)
    driver.get 'http://live.techpanda.org/index.php/'

    # Click on mobile menu
    mobile_page = main_page.open_mobile_dir

    # Add 2 phones to comparison
    mobile_page.add_phones_to_comparison

    # Compare phone names on Compare pages and added
    compare_page = mobile_page.click_compare
    comp_page_heading = compare_page.get_page_heading
    assert_equal(EXPECT_COMP_PAGE_HEADING, comp_page_heading)

    phone_names = compare_page.compared_products_names
    assert_true(phone_names.eql?(EXPECT_PHONE_NAMES))

    compare_page.close_compare_window
    number_opened_pages = mobile_page.how_many_pages_opened?
    assert_equal(EXPECT_NUM_OPENED_PAGES, number_opened_pages)
  end

end
