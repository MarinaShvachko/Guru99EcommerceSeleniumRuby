require 'selenium-webdriver'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/tests/TestsSetUp.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MainPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MobilePage.rb'
require 'test/unit'

class SortChecks < Test::Unit::TestCase

  # temporary expected results
  EXPECT_MAIN_PAGE_TITLE = 'Home page' # actual Home page, expect THIS IS DEMO SITE
  EXPECT_MOB_PAGE_TITLE = 'Mobile' # actual Mobile, expect MOBILE

  #---
  BROWSER = 'firefox'.freeze


  def test_sort_mobiles_by_name
    driver = TestsSetUp.open_browser(BROWSER)
    driver.manage.window.maximize
    driver.manage.timeouts.implicit_wait = 5
    main_page = MainPage.new(driver)

    driver.get 'http://live.techpanda.org/index.php/'
    main_page_title = main_page.get_title
    # find out how do soft assert on Ruby
    assert_equal(main_page_title, EXPECT_MAIN_PAGE_TITLE, 'Main page title is not right')

    mobile_page = main_page.open_mobile_dir
    mobile_page_title = mobile_page.get_title
    assert_equal(mobile_page_title, EXPECT_MOB_PAGE_TITLE, 'Mobile page title is not right')

    mobile_page.open_sort_menu
    mobile_page.sort_by_name
    assert_true(mobile_page.sorted_by_name?, 'Mobile phones not sorted by name')

    TestsSetUp.tear_down
  end
end
